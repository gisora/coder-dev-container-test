-- PostgreSQL initialization script for local development.
--
-- Creates all databases referenced by the DSP IDS microservices in
-- properties/*.yml. Based on libs/postgres/src/main/docker/init.sql,
-- with additional databases needed by integration, report and
-- experiment services.
--
-- This script runs only once, when the PostgreSQL data directory is
-- first initialized (fresh volume). To re-run, delete the
-- postgres-data Docker volume.

-- Core service databases (from libs/postgres init.sql)
CREATE DATABASE "user_service";
CREATE DATABASE "system_settings_service";
CREATE DATABASE "authorization_server";
CREATE DATABASE "identity_provider";
CREATE DATABASE "document_service";
CREATE DATABASE "report_service";
CREATE DATABASE "menu_service";
CREATE DATABASE "mail_service";
CREATE DATABASE "file_service";
CREATE DATABASE "product_service";
CREATE DATABASE "activiti_service";
CREATE DATABASE "message_service";
CREATE DATABASE "ldap_service";

-- Additional databases referenced in properties/*.yml
CREATE DATABASE "orbeon";
CREATE DATABASE "orbeon_experiment_service";
CREATE DATABASE "estag";
CREATE DATABASE "InformationProvidersDb";

-- Create the microuser role (matches libs/postgres set-config.sh)
CREATE ROLE microuser WITH LOGIN PASSWORD '123456' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

-- Grant privileges to microuser on all databases
\connect user_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect system_settings_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect authorization_server
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect identity_provider
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect ldap_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect document_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect report_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect menu_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect mail_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect file_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect product_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect activiti_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect message_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect orbeon
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect orbeon_experiment_service
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect estag
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;

\connect "InformationProvidersDb"
GRANT ALL ON schema public TO microuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO microuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO microuser;