USE juzz4v2;

/* run this update script and only this to update core engine's database to latest version */
/* this script file is divided into 3 sections: edit tables, edit events, edit models      */
/* please put the updated content to the corresponding section                             */

/* section 1. edit tables                                                                  */
/* including create/drop/update tables, and procedures                                     */
/*add by lizhinian 2014-06-18 [begin]*/
DROP PROCEDURE IF EXISTS keepCloudAddress;
DELIMITER //  
CREATE PROCEDURE keepCloudAddress()
BEGIN
SELECT COUNT(*) into @tblName FROM information_schema.tables WHERE table_name='configurations';
IF @tblName = 1 THEN 
    SELECT VALUE INTO @x FROM configurations WHERE name="kup-arbiter-host";
	DROP TABLE configurations;
	CREATE TABLE `configurations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT NULL,
	`value` text,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;	
	IF (@x IS NOT NULL) THEN
		INSERT INTO configurations(name,value) VALUES("kup-arbiter-host",@x);	
	END IF;	
	SET @x=NULL;
ELSE
    CREATE TABLE `configurations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT NULL,
	`value` text,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
END IF;
END
//
DELIMITER ;
call keepCloudAddress();
/*add configuration for platform*/
insert into configurations(name,value) values("platform-settings","{\"host\":\"localhost\",\"event-port\":\"7474\"}");
/*add by lizhinian 2014-06-18 [end]*/

/*add by lizhinian for load-balance-arbiter 2014-02-18 [begin]*/
DROP TABLE IF EXISTS cloud_recording_info;
DROP TABLE IF EXISTS recording_temp_info;
DROP TABLE IF EXISTS ds_device_info;
DROP TABLE IF EXISTS ds_server_info;
DROP TABLE IF EXISTS rs_device_info;
DROP TABLE IF EXISTS rs_server_info;
DROP TABLE IF EXISTS stream_session_info;

create table `ds_server_info` (
 `id` bigint(20) primary key,
 `type` varchar(255),
 `host` varchar(255),
 `port` smallint(5) unsigned,
 `register_time` bigint(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `ds_device_info` (
 `id` bigint(20) primary key,
 `device_key` varchar(255),
 `device_info` text,
 `status` tinyint(2),
 `server_id` bigint(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `cloud_recording_info`(
 `device_id` bigint(20) primary key,
 `server_id` bigint(20),
 `task` tinyint(2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `rs_server_info` (
 `id` bigint(20) primary key,
 `host` varchar(255),
 `port` smallint(5) unsigned,
 `server_info` text,
 `register_time` bigint(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `rs_device_info` (
 `id` bigint(20) primary key,
 `device_info` text,
 `server_id` bigint(20),
 `status` tinyint(2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `stream_session_info` (
 `id` varchar(255) primary key,
 `type` varchar(255),
 `ttl` bigint(20),
 `device_id` bigint(20),
 `channel_id` tinyint(2),
 `time` bigint(20),
 `start_time` bigint(20),
 `end_time` bigint(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*add by lizhinian for load-balance-arbiter 2014-02-18 [end]*/
/*add by lizhinian for load-balance-arbiter 2014-04-22 [begin]*/
DROP TABLE IF EXISTS cloud_recording_info;
DROP TABLE IF EXISTS recording_temp_info;
CREATE TABLE `recording_temp_info`(
 `id` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `device_id` bigint(20),
 `server_id` bigint(20),
 `type` tinyint(2),
 `task` tinyint(2),
 `time_interval` int(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE devices MODIFY COLUMN snapshot_recording_enabled INT(11);
/*add addCloudRecordingEnabled procedure [begin]*/
DROP PROCEDURE IF EXISTS addCloudRecordingEnabled;
DELIMITER //  
CREATE PROCEDURE addCloudRecordingEnabled()
BEGIN
SELECT COUNT(*) INTO @colName FROM information_schema.columns
WHERE table_name = 'devices' AND column_name = 'cloud_recording_enabled';
IF @colName = 0 THEN 
    ALTER TABLE devices ADD cloud_recording_enabled INT(11) DEFAULT 0;
END IF;
END
//
DELIMITER ;
call addCloudRecordingEnabled();
/*add addCloudRecordingEnabled procedure [end]*/
/*add by lizhinian for load-balance-arbiter 2014-04-22 [end]*/
/*add by lizhinian for NodeControlServer 2014-05-20 [begin]*/
DROP TABLE IF EXISTS tasks;
CREATE TABLE `tasks`(
 `id` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `device_id` bigint(20),
 `channel_id` tinyint(2),
 `command` varchar(255),
 `insert_time` bigint(20),
 `time` bigint(20), 
 `status` tinyint(2),
 index `idx_dev_id`(`device_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS channel_device_map;
CREATE TABLE `channel_device_map`(
 `kup_device_id` bigint(20),
 `kup_channel_id` tinyint(2),
 `node_device_id` bigint(20),
 index `idx_kup_dev_id`(`kup_device_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*add by lizhinian for NodeControlServer 2014-05-20 [end]*/
/*add by lizhinian for storage key 2014-06-07 [begin]*/
DROP TABLE IF EXISTS deviceid_serverid;
DROP TABLE IF EXISTS storage_keys;
CREATE TABLE `storage_keys`(
 `mac` varchar(255),
 `device_id` bigint(20),
 `channel` tinyint(2),
 `time` bigint(20),
 `namespace` varchar(255),
 `s_object` varchar(255),
 `s_key` varchar(255) unique,
 `insert_time` bigint(20),
 index `idx_storage_key`(mac(20),device_id,channel,namespace(20),s_object(20))
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*add by lizhinian for storage key 2014-06-07 [end]*/
/*add by lizhinian for storing kup ds info 2014-06-17 [begin]*/
DROP TABLE IF EXISTS tasks;
CREATE TABLE `tasks`(
 `id` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `device_id` bigint(20),
 `channel_id` tinyint(2),
 `command` varchar(255),
 `insert_time` bigint(20),
 `time` bigint(20), 
 `status` tinyint(2),
 `t_data` varchar(255),
 index `idx_dev_id`(`device_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*add by lizhinian for storing kup ds info 2014-06-17 [end]*/

/*add by lizhinian for Table-Clean 2014-07-22 [begin]*/
DROP PROCEDURE IF EXISTS dropColumnsFromDevices;
DELIMITER //  
CREATE PROCEDURE dropColumnsFromDevices()
BEGIN
        IF EXISTS (SELECT column_name FROM information_schema.columns WHERE table_name = 'devices' AND column_name in ('alive','alert_flag','action','events_settings','liveview','account_id','status_id','functionality_id') )
        THEN
                ALTER TABLE devices DROP COLUMN alive;
                ALTER TABLE devices DROP COLUMN alert_flag;
                ALTER TABLE devices DROP COLUMN action;
                ALTER TABLE devices DROP COLUMN events_settings;
                ALTER TABLE devices DROP COLUMN liveview;
                ALTER TABLE devices DROP KEY FK5CF8ACDD9737AEF6;
                ALTER TABLE devices DROP COLUMN account_id;

                ALTER TABLE devices DROP FOREIGN KEY FK5CF8ACDD3F52909E; 
                ALTER TABLE devices DROP KEY FK5CF8ACDD3F52909E;
                ALTER TABLE devices DROP COLUMN status_id;
                ALTER TABLE devices DROP FOREIGN KEY FK5CF8ACDD136CC580; 
                ALTER TABLE devices DROP KEY FK5CF8ACDD136CC580;
                ALTER TABLE devices DROP COLUMN functionality_id;
        END IF;
END
//
DELIMITER ;
call dropColumnsFromDevices();

DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS system_events;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS vouchers;
DROP TABLE IF EXISTS alert_assignments;
DROP TABLE IF EXISTS audit_log;
DROP TABLE IF EXISTS custom_data;
DROP TABLE IF EXISTS device_functionalities;
DROP TABLE IF EXISTS roles_permissions;
DROP TABLE IF EXISTS users_devices;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS permissions;
DROP TABLE IF EXISTS accounts;
/*add by lizhinian for Table-Clean 2014-07-22 [end]*/


/* section 2. edit events                                                                  */
/* including insert/delete/update event types                                              */
/*add by lizhinian 2013-09-26 [begin]*/
LOCK TABLES `event_types` WRITE;
DELETE FROM `event_types` WHERE id = 5010;
INSERT INTO `event_types` VALUES (5010,'Audio','event-audio',NULL);
DELETE FROM `event_types` WHERE id = 5015;
INSERT INTO `event_types` VALUES (5015,'Passive infrared','event-passive-infrared',NULL);
DELETE FROM `event_types` WHERE id = 9800;
INSERT INTO `event_types` VALUES (9800,'Event video recording','event-recording',NULL);
DELETE FROM `event_types` WHERE id = 5020;
INSERT INTO `event_types` VALUES (5020,'Event Intercom Visitor Alert','event-intercom-visitor-alert',NULL);
UNLOCK TABLES;
/*add by lizhinian 2013-09-26 [end]*/
/*add by huaxiufeng for new event types and kai-one 2014-01-20 [begin]*/
LOCK TABLES `event_types` WRITE;
DELETE FROM `event_types` WHERE id = 6;
INSERT INTO `event_types` VALUES (6,'Connection poor','event-connection-poor',NULL);
DELETE FROM `event_types` WHERE id = 6001;
INSERT INTO `event_types` VALUES (6001,'Node unregistered','event-node-unregistered',NULL);
DELETE FROM `event_types` WHERE id = 6002;
INSERT INTO `event_types` VALUES (6002,'Node registered','event-node-registered',NULL);
DELETE FROM `event_types` WHERE id = 6021;
INSERT INTO `event_types` VALUES (6021,'Upstream failed','event-upstream-failed',NULL);
DELETE FROM `event_types` WHERE id = 7001;
INSERT INTO `event_types` VALUES (7001,'Storage started','event-storage-started',NULL);
DELETE FROM `event_types` WHERE id = 7002;
INSERT INTO `event_types` VALUES (7002,'Storage stopped','event-storage-stopped',NULL);
DELETE FROM `event_types` WHERE id = 7021;
INSERT INTO `event_types` VALUES (7021,'Disk full','event-disk-full',NULL);
UNLOCK TABLES;
/*add by huaxiufeng for new event types and kai-one 2014-01-20 [end]*/


/* section 3. edit devices                                                                 */
/* including insert/delete/update device models                                            */
/* update device models */
LOCK TABLES `device_models` WRITE;
/*!40000 ALTER TABLE `device_models` ENABLE KEYS */;
/* update amtk model */
DELETE FROM `device_models` WHERE id = 111;
INSERT INTO `device_models` VALUES (
111,
NULL,
NULL,
NULL,
NULL,
'Amtk IP Camera',
1,
NULL,
NULL,
'{\r\n	\"servertype\": \"amtk-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/\"}',
NULL
);
/* add kai-node model */
DELETE FROM `device_models` WHERE id = 115;
INSERT INTO `device_models` VALUES (
115,
NULL,
NULL,
NULL,
NULL,
'KAI NODE',
4,
NULL,
NULL,
'{\r\n	\"servertype\": \"kai-node\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\", \"node\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/\"}',
NULL
);
/* add kai-one model */
DELETE FROM `device_models` WHERE id = 117;
INSERT INTO `device_models` VALUES (
117,
NULL,
NULL,
NULL,
NULL,
'KAI ONE',
1,
NULL,
NULL,
'{\r\n	\"servertype\": \"kai-one\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\", \"node\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/\"}',
NULL
);
/* update kai-node-8 to kai-node-10 */
DELETE FROM `device_models` WHERE id = 121;
INSERT INTO `device_models` VALUES (
121,
NULL,
NULL,
NULL,
NULL,
'KAI NODE 10',
10,
NULL,
NULL,
'{\r\n	\"servertype\": \"kai-node-10\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\", \"node\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/\ \r\n"}',
NULL
);
/* add ingrasys-ipc model */
DELETE FROM `device_models` WHERE id = 124;
INSERT INTO `device_models` VALUES (
124,
NULL,
NULL,
NULL,
NULL,
'Ingrasys IP Camera',
1,
NULL,
NULL,
'{\r\n	\"servertype\": \"ingrasys-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"]}',
NULL
);
/*!40000 ALTER TABLE `device_models` DISABLE KEYS */;
UNLOCK TABLES;

