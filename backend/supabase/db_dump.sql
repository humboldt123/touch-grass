--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA extensions;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
    column_name text,
    op realtime.equality_op,
    value text
    );


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
    name text,
    type_name text,
    type_oid oid,
    value jsonb,
    is_pkey boolean,
    is_selectable boolean
    );


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
    wal jsonb,
    is_rls_enabled boolean,
    subscription_ids uuid[],
    errors text[]
    );


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select
    coalesce(
            nullif(current_setting('request.jwt.claim.email', true), ''),
            (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
    )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
select
    coalesce(
            nullif(current_setting('request.jwt.claim', true), ''),
            nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select
    coalesce(
            nullif(current_setting('request.jwt.claim.role', true), ''),
            (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
    )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
select
    coalesce(
            nullif(current_setting('request.jwt.claim.sub', true), ''),
            (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
    )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
revoke all on table cron.job from postgres;
grant select on table cron.job to postgres with grant option;
END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
DROP FUNCTION IF EXISTS graphql_public.graphql;
create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
select graphql.resolve(
               query := query,
               variables := coalesce(variables, '{}'),
               "operationName" := "operationName",
               extensions := extensions
       );
$$;

-- This hook executes when `graphql.resolve` is created. That is not necessarily the last
-- function in the extension so we need to grant permissions on existing entities AND
-- update default permissions to any others that are created after `graphql.resolve`
grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
cmd record;
BEGIN
FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
                             LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
               THEN
               NOTIFY pgrst, 'reload schema';
END IF;
END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
obj record;
BEGIN
FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
                             LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
END IF;
END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
graphql_is_dropped bool;
BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
server_version float;
BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
END IF;
END;
        $$;
END IF;

END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

RETURN QUERY
SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: nearby(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nearby(lng double precision, lat double precision) RETURNS json
    LANGUAGE sql
    AS $$select row_to_json(b) from (
  select * from (
  select id, name, type
  from location
  order by loc <-> ST_SetSRID(st_makepoint(lng, lat), 4326)
  ) b
) b ;$$;


ALTER FUNCTION public.nearby(lng double precision, lat double precision) OWNER TO postgres;

--
-- Name: FUNCTION nearby(lng double precision, lat double precision); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.nearby(lng double precision, lat double precision) IS 'Post with a JSON request body { "lat": float, "lng": float} returns locations sorted by proximity';


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

        -- I, U, D, T: insert, update ...
action realtime.action = (
            case wal ->> 'action'
                when 'I' then 'INSERT'
                when 'U' then 'UPDATE'
                when 'D' then 'DELETE'
                else 'ERROR'
            end
        );

        -- Is row level security enabled for the table
        is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

        subscriptions realtime.subscription[] = array_agg(subs)
            from
                realtime.subscription subs
            where
                subs.entity = entity_;

        -- Subscription vars
        roles regrole[] = array_agg(distinct us.claims_role)
            from
                unnest(subscriptions) us;

        working_role regrole;
        claimed_role regrole;
        claims jsonb;

        subscription_id uuid;
        subscription_has_access bool;
        visible_to_subscription_ids uuid[] = '{}';

        -- structured info for wal's columns
        columns realtime.wal_column[];
        -- previous identity values for update/delete
        old_columns realtime.wal_column[];

        error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

        -- Primary jsonb output for record
output jsonb;

begin
        perform set_config('role', null, true);

        columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'columns') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

        old_columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'identity') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

                                  -- Update `is_selectable` for columns and old_columns
    columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                    from
                        unnest(columns) c;

old_columns =
                    array_agg(
                        (
                            c.name,
                            c.type_name,
                            c.type_oid,
                            c.value,
                            c.is_pkey,
                            pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                        )::realtime.wal_column
                    )
                    from
                        unnest(old_columns) c;

            if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    -- subscriptions is already filtered by entity
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;

            -- The claims role does not have SELECT permission to the primary key of entity
            elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;

else
                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
end
                -- Add "old_record" key for update and delete
|| case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
end;

                -- Create the prepared statement
                if is_rls_enabled and action <> 'DELETE' then
                    if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                        deallocate walrus_rls_stmt;
end if;
execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
end if;

                visible_to_subscription_ids = '{}';

for subscription_id, claims in (
                        select
                            subs.subscription_id,
                            subs.claims
                        from
                            unnest(subscriptions) subs
                        where
                            subs.entity = entity_
                            and subs.claims_role = working_role
                            and (
                                realtime.is_visible_through_filters(columns, subs.filters)
                                or action = 'DELETE'
                            )
                ) loop

                    if not is_rls_enabled or action = 'DELETE' then
                        visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
else
                        -- Check if RLS allows the role to see the record
                        perform
                            set_config('role', working_role::text, true),
                            set_config('request.jwt.claims', claims::text, true);

execute 'execute walrus_rls_stmt' into subscription_has_access;

if subscription_has_access then
                            visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
end if;
end if;
end loop;

                perform set_config('role', null, true);

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;

end if;
end loop;

        perform set_config('role', null, true);
end;
    $$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
/*
Builds a sql string that, if executed, creates a prepared statement to
tests retrive a row from *entity* by its primary key columns.
Example
    select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
*/
select
    'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
from
    unnest(columns) pkc
where
    pkc.is_pkey
group by
    entity
    $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
res jsonb;
begin
execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
return res;
end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: channel_name(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.channel_name() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.channel_name', true), '')::text;
$$;


ALTER FUNCTION realtime.channel_name() OWNER TO supabase_realtime_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
/*
Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
*/
declare
op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
begin
execute format(
        'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
return res;
end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
/*
Should the record be visible (true) or filtered out (false) after *filters* are applied
*/
select
    -- Default to allowed when no filters present
    $2 is null -- no filters. this should not happen because subscriptions has a default
        or array_length($2, 1) is null -- array length of an empty array is null
        or bool_and(
            coalesce(
                    realtime.check_equality_op(
                            op:=f.op,
                            type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                            val_1:=col.value #>> '{}',
                            val_2:=f.value
                    ),
                    false -- if null, filter does not match
            )
           )
from
    unnest(filters) f
        join unnest(columns) col
             on f.column_name = col.name;
$_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
select
    xyz.wal,
    xyz.is_rls_enabled,
    xyz.subscription_ids,
    xyz.errors
from
    w2j,
    realtime.apply_rls(
            wal := w2j.data::jsonb,
            max_record_bytes := max_record_bytes
    ) xyz(wal, is_rls_enabled, subscription_ids, errors)
where
    w2j.w2j_add_tables <> ''
  and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
select
    (
        select string_agg('' || ch,'')
        from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
        where
            not (x.idx = 1 and x.ch = '"')
          and not (
            x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
                and x.ch = '"'
            )
    )
        || '.'
        || (
        select string_agg('' || ch,'')
        from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
        where
            not (x.idx = 1 and x.ch = '"')
          and not (
            x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
                and x.ch = '"'
            )
    )
from
    pg_class pc
        join pg_namespace nsp
             on pc.relnamespace = nsp.oid
where
    pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
/*
Validates that the user defined filters for a subscription:
- refer to valid columns that the claimed role may access
- values are coercable to the correct column type
*/
declare
col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
begin
for filter in select * from unnest(new.filters) loop
                            -- Filtered column is valid
    if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
end if;
else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
end if;

end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

return new;
end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
-- hack to rollback the successful insert
RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
select string_to_array(name, '/') into _parts;
select _parts[array_length(_parts,1)] into _filename;
-- @todo return the last part instead of 2
return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
select string_to_array(name, '/') into _parts;
return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
select string_to_array(name, '/') into _parts;
return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query
select sum((metadata->>'size')::int) as size, obj.bucket_id
from "storage".objects as obj
group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
v_order_by text;
  v_sort_order text;
begin
case
    when sortcolumn = 'name' then
      v_order_by = 'name';
when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
else
      v_order_by = 'name';
end case;

case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
when sortorder = 'desc' then
      v_sort_order = 'desc';
else
      v_sort_order = 'asc';
end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
RETURN NEW;
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
RETURN new;
END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
                                        instance_id uuid,
                                        id uuid NOT NULL,
                                        payload json,
                                        created_at timestamp with time zone,
                                        ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
                                 id uuid NOT NULL,
                                 user_id uuid,
                                 auth_code text NOT NULL,
                                 code_challenge_method auth.code_challenge_method NOT NULL,
                                 code_challenge text NOT NULL,
                                 provider_type text NOT NULL,
                                 provider_access_token text,
                                 provider_refresh_token text,
                                 created_at timestamp with time zone,
                                 updated_at timestamp with time zone,
                                 authentication_method text NOT NULL,
                                 auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
                                 provider_id text NOT NULL,
                                 user_id uuid NOT NULL,
                                 identity_data jsonb NOT NULL,
                                 provider text NOT NULL,
                                 last_sign_in_at timestamp with time zone,
                                 created_at timestamp with time zone,
                                 updated_at timestamp with time zone,
                                 email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
                                 id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
                                id uuid NOT NULL,
                                uuid uuid,
                                raw_base_config text,
                                created_at timestamp with time zone,
                                updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
                                     session_id uuid NOT NULL,
                                     created_at timestamp with time zone NOT NULL,
                                     updated_at timestamp with time zone NOT NULL,
                                     authentication_method text NOT NULL,
                                     id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
                                     id uuid NOT NULL,
                                     factor_id uuid NOT NULL,
                                     created_at timestamp with time zone NOT NULL,
                                     verified_at timestamp with time zone,
                                     ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
                                  id uuid NOT NULL,
                                  user_id uuid NOT NULL,
                                  friendly_name text,
                                  factor_type auth.factor_type NOT NULL,
                                  status auth.factor_status NOT NULL,
                                  created_at timestamp with time zone NOT NULL,
                                  updated_at timestamp with time zone NOT NULL,
                                  secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
                                     instance_id uuid,
                                     id bigint NOT NULL,
                                     token character varying(255),
                                     user_id character varying(255),
                                     revoked boolean,
                                     created_at timestamp with time zone,
                                     updated_at timestamp with time zone,
                                     parent character varying(255),
                                     session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
                                     id uuid NOT NULL,
                                     sso_provider_id uuid NOT NULL,
                                     entity_id text NOT NULL,
                                     metadata_xml text NOT NULL,
                                     metadata_url text,
                                     attribute_mapping jsonb,
                                     created_at timestamp with time zone,
                                     updated_at timestamp with time zone,
                                     name_id_format text,
                                     CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
                                     CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
                                     CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
                                        id uuid NOT NULL,
                                        sso_provider_id uuid NOT NULL,
                                        request_id text NOT NULL,
                                        for_email text,
                                        redirect_to text,
                                        created_at timestamp with time zone,
                                        updated_at timestamp with time zone,
                                        flow_state_id uuid,
                                        CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
                                        version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
                               id uuid NOT NULL,
                               user_id uuid NOT NULL,
                               created_at timestamp with time zone,
                               updated_at timestamp with time zone,
                               factor_id uuid,
                               aal auth.aal_level,
                               not_after timestamp with time zone,
                               refreshed_at timestamp without time zone,
                               user_agent text,
                               ip inet,
                               tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
                                  id uuid NOT NULL,
                                  sso_provider_id uuid NOT NULL,
                                  domain text NOT NULL,
                                  created_at timestamp with time zone,
                                  updated_at timestamp with time zone,
                                  CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
                                    id uuid NOT NULL,
                                    resource_id text,
                                    created_at timestamp with time zone,
                                    updated_at timestamp with time zone,
                                    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
                            instance_id uuid,
                            id uuid NOT NULL,
                            aud character varying(255),
                            role character varying(255),
                            email character varying(255),
                            encrypted_password character varying(255),
                            email_confirmed_at timestamp with time zone,
                            invited_at timestamp with time zone,
                            confirmation_token character varying(255),
                            confirmation_sent_at timestamp with time zone,
                            recovery_token character varying(255),
                            recovery_sent_at timestamp with time zone,
                            email_change_token_new character varying(255),
                            email_change character varying(255),
                            email_change_sent_at timestamp with time zone,
                            last_sign_in_at timestamp with time zone,
                            raw_app_meta_data jsonb,
                            raw_user_meta_data jsonb,
                            is_super_admin boolean,
                            created_at timestamp with time zone,
                            updated_at timestamp with time zone,
                            phone text DEFAULT NULL::character varying,
                            phone_confirmed_at timestamp with time zone,
                            phone_change text DEFAULT ''::character varying,
                            phone_change_token character varying(255) DEFAULT ''::character varying,
                            phone_change_sent_at timestamp with time zone,
                            confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
                            email_change_token_current character varying(255) DEFAULT ''::character varying,
                            email_change_confirm_status smallint DEFAULT 0,
                            banned_until timestamp with time zone,
                            reauthentication_token character varying(255) DEFAULT ''::character varying,
                            reauthentication_sent_at timestamp with time zone,
                            is_sso_user boolean DEFAULT false NOT NULL,
                            deleted_at timestamp with time zone,
                            is_anonymous boolean DEFAULT false NOT NULL,
                            CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: affair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affair (
                               id bigint NOT NULL,
                               start_time timestamp with time zone,
                               "group" bigint,
                               event_name character varying,
                               description character varying,
                               lat double precision,
                               lng double precision,
                               location_id bigint,
                               location_name text
);


ALTER TABLE public.affair OWNER TO postgres;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.affair ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
                               id bigint NOT NULL,
                               created_at timestamp with time zone DEFAULT now() NOT NULL,
                               name character varying,
                               dob date,
                               mbti smallint,
                               tarot character varying,
                               lat double precision,
                               lng double precision,
                               "Year" bigint,
                               "Month" bigint,
                               "Hour" bigint,
                               "Minutes" bigint,
                               "Personality_Type" text,
                               "Introvert_Extrovert" text,
                               "Minority" bigint,
                               "Educational_Disability" bigint,
                               "Physical_Disability" bigint,
                               "Degree_Acquired" smallint,
                               "Astrology_Sign" text,
                               "Day" bigint,
                               "groupNum" bigint DEFAULT '0'::bigint
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
                                id bigint NOT NULL,
                                created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."group" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_membership (
                                         id bigint NOT NULL,
                                         created_at timestamp with time zone DEFAULT now() NOT NULL,
                                         "user" bigint,
                                         "group" bigint
);


ALTER TABLE public.group_membership OWNER TO postgres;

--
-- Name: group_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.group_membership ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.group_membership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
                                 id bigint NOT NULL,
                                 name character varying,
                                 type character varying,
                                 lat double precision,
                                 long double precision,
                                 loc extensions.geometry(Point,4326)
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.location ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: broadcasts; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.broadcasts (
                                     id bigint NOT NULL,
                                     channel_id bigint NOT NULL,
                                     inserted_at timestamp(0) without time zone NOT NULL,
                                     updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.broadcasts OWNER TO supabase_realtime_admin;

--
-- Name: broadcasts_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.broadcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.broadcasts_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: broadcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.broadcasts_id_seq OWNED BY realtime.broadcasts.id;


--
-- Name: channels; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.channels (
                                   id bigint NOT NULL,
                                   name character varying(255) NOT NULL,
                                   inserted_at timestamp(0) without time zone NOT NULL,
                                   updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.channels OWNER TO supabase_realtime_admin;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.channels_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.channels_id_seq OWNED BY realtime.channels.id;


--
-- Name: presences; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.presences (
                                    id bigint NOT NULL,
                                    channel_id bigint NOT NULL,
                                    inserted_at timestamp(0) without time zone NOT NULL,
                                    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.presences OWNER TO supabase_realtime_admin;

--
-- Name: presences_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.presences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.presences_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: presences_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.presences_id_seq OWNED BY realtime.presences.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
                                            version bigint NOT NULL,
                                            inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
                                       id bigint NOT NULL,
                                       subscription_id uuid NOT NULL,
                                       entity regclass NOT NULL,
                                       filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
                                       claims jsonb NOT NULL,
                                       claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
                                       created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
                                 id text NOT NULL,
                                 name text NOT NULL,
                                 owner uuid,
                                 created_at timestamp with time zone DEFAULT now(),
                                 updated_at timestamp with time zone DEFAULT now(),
                                 public boolean DEFAULT false,
                                 avif_autodetection boolean DEFAULT false,
                                 file_size_limit bigint,
                                 allowed_mime_types text[],
                                 owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
                                    id integer NOT NULL,
                                    name character varying(100) NOT NULL,
                                    hash character varying(40) NOT NULL,
                                    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
                                 id uuid DEFAULT gen_random_uuid() NOT NULL,
                                 bucket_id text,
                                 name text,
                                 owner uuid,
                                 created_at timestamp with time zone DEFAULT now(),
                                 updated_at timestamp with time zone DEFAULT now(),
                                 last_accessed_at timestamp with time zone DEFAULT now(),
                                 metadata jsonb,
                                 path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
                                 version text,
                                 owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
                                              id text NOT NULL,
                                              in_progress_size bigint DEFAULT 0 NOT NULL,
                                              upload_signature text NOT NULL,
                                              bucket_id text NOT NULL,
                                              key text NOT NULL COLLATE pg_catalog."C",
                                              version text NOT NULL,
                                              owner_id text,
                                              created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
                                                    id uuid DEFAULT gen_random_uuid() NOT NULL,
                                                    upload_id text NOT NULL,
                                                    size bigint DEFAULT 0 NOT NULL,
                                                    part_number integer NOT NULL,
                                                    bucket_id text NOT NULL,
                                                    key text NOT NULL COLLATE pg_catalog."C",
                                                    etag text NOT NULL,
                                                    owner_id text,
                                                    version text NOT NULL,
                                                    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
SELECT secrets.id,
       secrets.name,
       secrets.description,
       secrets.secret,
       CASE
           WHEN (secrets.secret IS NULL) THEN NULL::text
           ELSE
               CASE
                   WHEN (secrets.key_id IS NULL) THEN NULL::text
                   ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
                   END
           END AS decrypted_secret,
       secrets.key_id,
       secrets.nonce,
       secrets.created_at,
       secrets.updated_at
FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: broadcasts id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts ALTER COLUMN id SET DEFAULT nextval('realtime.broadcasts_id_seq'::regclass);


--
-- Name: channels id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.channels ALTER COLUMN id SET DEFAULT nextval('realtime.channels_id_seq'::regclass);


--
-- Name: presences id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences ALTER COLUMN id SET DEFAULT nextval('realtime.presences_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO auth.schema_migrations (version) VALUES ('20171026211738');
INSERT INTO auth.schema_migrations (version) VALUES ('20171026211808');
INSERT INTO auth.schema_migrations (version) VALUES ('20171026211834');
INSERT INTO auth.schema_migrations (version) VALUES ('20180103212743');
INSERT INTO auth.schema_migrations (version) VALUES ('20180108183307');
INSERT INTO auth.schema_migrations (version) VALUES ('20180119214651');
INSERT INTO auth.schema_migrations (version) VALUES ('20180125194653');
INSERT INTO auth.schema_migrations (version) VALUES ('00');
INSERT INTO auth.schema_migrations (version) VALUES ('20210710035447');
INSERT INTO auth.schema_migrations (version) VALUES ('20210722035447');
INSERT INTO auth.schema_migrations (version) VALUES ('20210730183235');
INSERT INTO auth.schema_migrations (version) VALUES ('20210909172000');
INSERT INTO auth.schema_migrations (version) VALUES ('20210927181326');
INSERT INTO auth.schema_migrations (version) VALUES ('20211122151130');
INSERT INTO auth.schema_migrations (version) VALUES ('20211124214934');
INSERT INTO auth.schema_migrations (version) VALUES ('20211202183645');
INSERT INTO auth.schema_migrations (version) VALUES ('20220114185221');
INSERT INTO auth.schema_migrations (version) VALUES ('20220114185340');
INSERT INTO auth.schema_migrations (version) VALUES ('20220224000811');
INSERT INTO auth.schema_migrations (version) VALUES ('20220323170000');
INSERT INTO auth.schema_migrations (version) VALUES ('20220429102000');
INSERT INTO auth.schema_migrations (version) VALUES ('20220531120530');
INSERT INTO auth.schema_migrations (version) VALUES ('20220614074223');
INSERT INTO auth.schema_migrations (version) VALUES ('20220811173540');
INSERT INTO auth.schema_migrations (version) VALUES ('20221003041349');
INSERT INTO auth.schema_migrations (version) VALUES ('20221003041400');
INSERT INTO auth.schema_migrations (version) VALUES ('20221011041400');
INSERT INTO auth.schema_migrations (version) VALUES ('20221020193600');
INSERT INTO auth.schema_migrations (version) VALUES ('20221021073300');
INSERT INTO auth.schema_migrations (version) VALUES ('20221021082433');
INSERT INTO auth.schema_migrations (version) VALUES ('20221027105023');
INSERT INTO auth.schema_migrations (version) VALUES ('20221114143122');
INSERT INTO auth.schema_migrations (version) VALUES ('20221114143410');
INSERT INTO auth.schema_migrations (version) VALUES ('20221125140132');
INSERT INTO auth.schema_migrations (version) VALUES ('20221208132122');
INSERT INTO auth.schema_migrations (version) VALUES ('20221215195500');
INSERT INTO auth.schema_migrations (version) VALUES ('20221215195800');
INSERT INTO auth.schema_migrations (version) VALUES ('20221215195900');
INSERT INTO auth.schema_migrations (version) VALUES ('20230116124310');
INSERT INTO auth.schema_migrations (version) VALUES ('20230116124412');
INSERT INTO auth.schema_migrations (version) VALUES ('20230131181311');
INSERT INTO auth.schema_migrations (version) VALUES ('20230322519590');
INSERT INTO auth.schema_migrations (version) VALUES ('20230402418590');
INSERT INTO auth.schema_migrations (version) VALUES ('20230411005111');
INSERT INTO auth.schema_migrations (version) VALUES ('20230508135423');
INSERT INTO auth.schema_migrations (version) VALUES ('20230523124323');
INSERT INTO auth.schema_migrations (version) VALUES ('20230818113222');
INSERT INTO auth.schema_migrations (version) VALUES ('20230914180801');
INSERT INTO auth.schema_migrations (version) VALUES ('20231027141322');
INSERT INTO auth.schema_migrations (version) VALUES ('20231114161723');
INSERT INTO auth.schema_migrations (version) VALUES ('20231117164230');
INSERT INTO auth.schema_migrations (version) VALUES ('20240115144230');
INSERT INTO auth.schema_migrations (version) VALUES ('20240214120130');
INSERT INTO auth.schema_migrations (version) VALUES ('20240306115329');
INSERT INTO auth.schema_migrations (version) VALUES ('20240314092811');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: extensions; Owner: supabase_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: affair; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (10, NULL, NULL, 'swim', 'go to swim!', NULL, NULL, NULL, NULL);
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (11, '2024-04-22 17:00:00+00', 2, 'Picnic', 'Join us for a delightful picnic! Enjoy serene views and lush greenery—perfect for a relaxing day out with loved ones. Your ideal escape!', NULL, NULL, 1, 'Wissahickon Valley');
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (24, '2024-04-25 14:00:00+00', 4, 'Play Soccer', 'Kick off some fun! Lace up your cleats, join friends for a game of soccer, and enjoy the thrill. ', NULL, NULL, 11, 'Fisher Soccer Field');
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (22, '2024-04-22 18:00:00+00', 1, 'Write novel', 'Creative outlet, mental exercise. Bring your diverse or complementary skills and perspectives! Create something together or individually', NULL, NULL, 92, 'Campbell Square');
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (23, NULL, 0, 'Edit manuscript', 'enhance clarity and structure. Enables improved readability, sharpens expression accuracy.', NULL, NULL, NULL, NULL);
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (9, NULL, 0, NULL, NULL, 40.08424385201485, -75.18009603022776, 346, NULL);
INSERT INTO public.affair (id, start_time, "group", event_name, description, lat, lng, location_id, location_name) VALUES (25, '2024-04-21 20:00:00+00', 3, 'Play UNO!', 'Shout UNO! Gather friends or family for a spirited game of UNO, the classic card game of matching colors and numbers. ', NULL, NULL, 10, 'Awbury Rec Center');


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" (id, created_at) VALUES (1, '2024-04-20 23:09:03.267416+00');
INSERT INTO public."group" (id, created_at) VALUES (4, '2024-04-21 00:21:06.595622+00');
INSERT INTO public."group" (id, created_at) VALUES (5, '2024-04-21 00:21:06.665486+00');
INSERT INTO public."group" (id, created_at) VALUES (6, '2024-04-21 00:21:07.147928+00');
INSERT INTO public."group" (id, created_at) VALUES (7, '2024-04-21 00:21:07.62852+00');
INSERT INTO public."group" (id, created_at) VALUES (42, '2024-04-21 05:21:15.787545+00');


--
-- Data for Name: group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.group_membership (id, created_at, "user", "group") VALUES (2, '2024-04-20 23:09:14.438948+00', 1, 1);
INSERT INTO public.group_membership (id, created_at, "user", "group") VALUES (3, '2024-04-20 23:09:21.350144+00', 2, 1);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (1, 'Wissahickon Valley Park', 'picnic table', 40.0843288686737, -75.2293143719592, '0101000020E610000053043016ADCE52C0F787D249CB0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (2, 'Wissahickon Valley Park', 'picnic table', 40.084158835356, -75.2297427947861, '0101000020E610000045861F1BB4CE52C001C37AB7C50A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (3, 'Wissahickon Valley Park', 'picnic table', 40.084799474881, -75.2298598724229, '0101000020E610000006AE2E06B6CE52C07BAA8DB5DA0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (4, 'Wissahickon Valley Park', 'picnic table', 40.0536189175878, -75.2250327026414, '0101000020E6100000059890EF66CE52C046BE14FCDC064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (5, 'Wisters Woods Park', 'picnic table', 40.0318107942365, -75.1547728551995, '0101000020E6100000FCD867CCE7C952C0E973486012044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (6, 'Wisters Woods Park', 'picnic table', 40.032412198415, -75.1553975536461, '0101000020E610000075B29408F2C952C08A173A1526044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (7, 'Wisters Woods Park', 'picnic table', 40.0333678629584, -75.1554827385965, '0101000020E61000005457DF6DF3C952C06612EC6545044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (8, 'Awbury Park and Recreation Center', 'picnic table', 40.0522735793715, -75.1635558636865, '0101000020E6100000906603B377CA52C038EC90E6B0064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (9, 'Awbury Park and Recreation Center', 'picnic table', 40.0523054730836, -75.1632760768893, '0101000020E61000005C9D801D73CA52C0DF251CF2B1064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (10, 'Awbury Park and Recreation Center', 'picnic table', 40.0519506670972, -75.1631710514703, '0101000020E6100000026EFE6471CA52C00C18C851A6064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (11, 'Fisher Park', 'picnic table', 40.043039975086, -75.1308776884963, '0101000020E610000088F7CF4C60C852C020B57A5582054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (12, 'Fisher Park', 'picnic table', 40.042935452384, -75.1310908306058, '0101000020E61000007990CBCA63C852C004EAADE87E054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (13, 'Burholme Park', 'picnic table', 40.0691872155977, -75.0892760923879, '0101000020E6100000BA4712B3B6C552C08F256E20DB084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (14, 'Burholme Park', 'picnic table', 40.0694709115184, -75.0896943995852, '0101000020E61000009436948DBDC552C0577F3E6CE4084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (15, 'Burholme Park', 'picnic table', 40.0670571884748, -75.089218232259, '0101000020E6100000997063C0B5C552C001BB775495084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (16, 'Burholme Park', 'picnic table', 40.0697029696979, -75.0912691599305, '0101000020E61000003C429A5AD7C552C0AEA4E306EC084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (17, 'Burholme Park', 'picnic table', 40.0699480774032, -75.0918654235669, '0101000020E61000009876831FE1C552C0B26E000FF4084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (18, 'Hunting Park', 'picnic table', 40.016994153774, -75.1435389074749, '0101000020E6100000BB53D0BD2FC952C05D574BDD2C024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (19, 'Hunting Park', 'picnic table', 40.0171145058627, -75.1433124317975, '0101000020E61000008DEBE7072CC952C0D77BE1CE30024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (20, 'Hunting Park', 'picnic table', 40.0169390781613, -75.1450887924268, '0101000020E6100000509F802249C952C0145D490F2B024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (21, 'Hunting Park', 'picnic table', 40.017294609764, -75.1457818203419, '0101000020E610000011AE457D54C952C0AFAAB3B536024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (22, 'Hunting Park', 'picnic table', 40.0156204227346, -75.1445757954438, '0101000020E61000005B4ED6BA40C952C0BC659AD9FF014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (23, 'Hunting Park', 'picnic table', 40.0158436628282, -75.1428815889494, '0101000020E61000003EEFD1F824C952C016D9462A07024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (24, 'West Fairmount Park', 'picnic table', 39.9791567606119, -75.2071996717493, '0101000020E6100000EE7969C242CD52C0223E3C0255FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (25, 'West Fairmount Park', 'picnic table', 39.9789237131194, -75.2045653581925, '0101000020E610000034D54C9917CD52C038904A5F4DFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (26, 'Cobbs Creek Park', 'picnic table', 39.917490800277, -75.2461454624268, '0101000020E6100000A4CBE5D8C0CF52C009C9AA5670F54340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (27, 'Pennypack Park', 'picnic table', 40.0866444430857, -75.0615911319565, '0101000020E6100000845EEE1BF1C352C074B7442A170B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (28, 'Pennypack Park', 'picnic table', 40.0874694738392, -75.0616275934773, '0101000020E610000009A1DCB4F1C352C0D3C42033320B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (29, 'Pennypack Park', 'picnic table', 40.0499339680831, -75.0353336223084, '0101000020E6100000E210F4E742C252C02FF07B3C64064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (30, 'Pennypack Park', 'picnic table', 40.0497641555882, -75.035726380494, '0101000020E6100000E0F44C5749C252C0D761FEAB5E064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (31, 'Pennypack Park', 'picnic table', 40.0495407805471, -75.0366469042209, '0101000020E610000038C8416C58C252C05122305A57064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (32, 'East Fairmount Park', 'picnic table', 39.9820504987119, -75.1889924992479, '0101000020E610000061DDFE7318CC52C07A7EABD4B3FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (33, 'Pennypack Park', 'picnic table', 40.0499300486303, -75.0333789170769, '0101000020E6100000284E53E122C252C038FA9A1B64064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (34, 'Pennypack Park', 'picnic table', 40.050302534928, -75.0331213555868, '0101000020E6100000D9C208A91EC252C0F9353F5070064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (35, 'West Fairmount Park', 'picnic table', 39.9905472311027, -75.2011589022653, '0101000020E6100000D7A196C9DFCC52C05F5D6D40CAFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (36, 'East Fairmount Park', 'picnic table', 39.9830820338243, -75.1889230833059, '0101000020E61000008810D85017CC52C0C047D0A1D5FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (37, 'Joseph E Mander Playground', 'picnic table', 39.9897701370613, -75.1892670380401, '0101000020E6100000F4A57EF31CCC52C02C9EB0C9B0FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (38, 'Joseph E Mander Playground', 'picnic table', 39.99088912409, -75.1893456830608, '0101000020E6100000A2185B3D1ECC52C0DEF66E74D5FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (39, 'Joseph E Mander Playground', 'picnic table', 39.9918985428035, -75.1886337000252, '0101000020E61000000822159312CC52C042250D88F6FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (40, 'Belmont Plateau', 'picnic table', 39.9884033114648, -75.2142021370849, '0101000020E6100000D460E17CB5CD52C0EDFFECFF83FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (41, 'Belmont Plateau', 'picnic table', 39.9888948785763, -75.2137914226086, '0101000020E61000003B1138C2AECD52C064557D1B94FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (42, 'Belmont Plateau', 'picnic table', 39.9888382834191, -75.2142243843645, '0101000020E61000007B3631DAB5CD52C0AE28BC4092FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (43, 'Belmont Plateau', 'picnic table', 39.9884412078858, -75.2116521323299, '0101000020E6100000149F62B58BCD52C0B2F1D23D85FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (44, 'Belmont Plateau', 'picnic table', 39.988646966241, -75.2116228946679, '0101000020E6100000BEEBC03A8BCD52C0B9A5D9FB8BFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (45, 'Belmont Plateau', 'picnic table', 39.9899059286041, -75.2134253785806, '0101000020E6100000F748EBC2A8CD52C04EBCCA3CB5FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (46, 'Cobbs Creek Park', 'picnic table', 39.9373200128002, -75.2342006191888, '0101000020E61000009B079824FDCE52C07C6E281AFAF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (47, 'Cobbs Creek Park', 'picnic table', 39.9375758389508, -75.2342555007357, '0101000020E610000059A4C80AFECE52C01FE82E7C02F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (48, 'Whitby Avenue Playground', 'picnic table', 39.9409819366088, -75.2379060095347, '0101000020E61000004C9E20DA39CF52C047EE991872F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (49, 'Whitby Avenue Playground', 'picnic table', 39.9407461996703, -75.238001048526, '0101000020E61000004EF5BF683BCF52C0CAB5185F6AF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (50, 'Whitby Avenue Playground', 'picnic table', 39.9407497836271, -75.2385240947399, '0101000020E6100000D18D90FA43CF52C0E032297D6AF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (51, 'Whitby Avenue Playground', 'picnic table', 39.9405963187698, -75.238256390986, '0101000020E610000043D6BB973FCF52C059EDCD7565F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (52, 'Robert Wilson III Park', 'picnic table', 39.9430973617805, -75.2458511265511, '0101000020E6100000310E5D06BCCF52C044E5126AB7F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (53, 'Robert Wilson III Park', 'picnic table', 39.9435762571681, -75.2460591319704, '0101000020E61000007B2CCD6EBFCF52C0D7E8561BC7F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (54, 'Rufus O Williams Memorial Playground', 'picnic table', 39.9506889854333, -75.2500009429018, '0101000020E6100000E06EF40300D052C03E8D3A2DB0F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (55, 'Rufus O Williams Memorial Playground', 'picnic table', 39.9500545690086, -75.2499169448591, '0101000020E6100000B538A4A3FECF52C056A75B639BF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (56, 'Cobbs Creek Park', 'picnic table', 39.9539953336085, -75.2488447059055, '0101000020E610000066695812EDCF52C04C31E3841CFA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (57, 'Cobbs Creek Park', 'picnic table', 39.9538377849776, -75.2488872944324, '0101000020E6100000887EF9C4EDCF52C07D15465B17FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (58, 'Cobbs Creek Park', 'picnic table', 39.9535829201565, -75.2489100410467, '0101000020E6100000437C6124EECF52C0550C50010FFA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (59, 'Cobbs Creek Park', 'picnic table', 39.9532656595433, -75.2494610208185, '0101000020E6100000B4825B2BF7CF52C0B511F09B04FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (60, 'Johnny Sample Recreation Center', 'picnic table', 39.9577434475343, -75.2495043168094, '0101000020E6100000103AF4E0F7CF52C01E8F585697FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (61, 'Johnny Sample Recreation Center', 'picnic table', 39.9586047545153, -75.2479112902913, '0101000020E61000000F0751C7DDCF52C07737838FB3FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (62, 'Johnny Sample Recreation Center', 'picnic table', 39.958832602118, -75.2477757638251, '0101000020E6100000B297E08EDBCF52C0BB37D606BBFA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (63, 'Frank Palumbo Sr Park', 'picnic table', 39.939244620446, -75.1556715955752, '0101000020E610000058FAFE85F6C952C037E1EF2A39F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (64, 'West Fairmount Park', 'picnic table', 39.9846903332841, -75.2191390477538, '0101000020E610000044D8C85F06CE52C03F1235550AFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (65, 'West Fairmount Park', 'picnic table', 39.9848463916643, -75.2208160056881, '0101000020E610000048B774D921CE52C011E451720FFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (66, 'Bartrams Garden', 'picnic table', 39.93270183644, -75.2116669528564, '0101000020E6100000620A8CF38BCD52C0E83616C662F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (67, 'West Fairmount Park', 'picnic table', 39.9848791803816, -75.2195873696279, '0101000020E6100000A8CA2EB80DCE52C008205F8510FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (68, 'West Fairmount Park', 'picnic table', 39.9843841816033, -75.2182932771028, '0101000020E6100000F7855D84F8CD52C0CC57054D00FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (69, 'Belmont Grove', 'picnic table', 39.991913652998, -75.2154286679825, '0101000020E6100000C3E65295C9CD52C0890ACE06F7FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (70, 'West Fairmount Park', 'picnic table', 40.0017687016589, -75.1930634739032, '0101000020E6100000D99DE6265BCC52C003E4F1F439004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (71, 'West Fairmount Park', 'picnic table', 40.0015449226975, -75.1931609419125, '0101000020E61000003D18B6BF5CCC52C0F53AC09F32004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (72, 'West Fairmount Park', 'picnic table', 40.0014795245937, -75.1929410273023, '0101000020E61000007B94522559CC52C02DDF267B30004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (73, 'East Fairmount Park', 'picnic table', 39.971327238051, -75.1864077905218, '0101000020E6100000B000F11AEECB52C05092707354FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (74, 'East Fairmount Park', 'picnic table', 39.9717306803674, -75.1869530733634, '0101000020E6100000E1FE050AF7CB52C05259C2AB61FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (75, 'Cobbs Creek Park', 'picnic table', 39.9737119409223, -75.2569809708274, '0101000020E61000007959506072D052C034FEC697A2FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (76, 'East Fairmount Park', 'picnic table', 39.9734885392428, -75.188014677307, '0101000020E6100000E68CB66E08CC52C0118ABF459BFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (77, 'West Fairmount Park', 'picnic table', 40.002182869895, -75.1930736269266, '0101000020E6100000AC577C515BCC52C0BD673D8747004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (78, 'West Fairmount Park', 'picnic table', 40.0025205232999, -75.1930639772177, '0101000020E6100000E30B03295BCC52C02992AE9752004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (79, 'West Fairmount Park', 'picnic table', 39.9875815072875, -75.2222806265247, '0101000020E61000004F5D85D839CE52C094F7211269FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (80, 'West Fairmount Park', 'picnic table', 39.993030669488, -75.1979538699681, '0101000020E61000004C68B546ABCC52C01FB004A11BFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (81, 'West Fairmount Park', 'picnic table', 39.9926051199508, -75.1983534189027, '0101000020E610000029CF89D2B1CC52C0F30340AF0DFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (82, 'West Fairmount Park', 'picnic table', 39.9942044317686, -75.2132443793361, '0101000020E61000007BD3C0CBA5CD52C001FE3F1742FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (83, '29th and Chalmers Playground', 'picnic table', 39.9985398353023, -75.179091263813, '0101000020E6100000E044343B76CB52C035304027D0FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (84, '45th and Sansom Tot Lot', 'picnic table', 39.9561323648396, -75.2118656667556, '0101000020E6100000137703358FCD52C00DD19A8B62FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (85, '48th and Woodland Playground', 'picnic table', 39.9413944519518, -75.2103314907759, '0101000020E6100000E48C361276CD52C069E2079D7FF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (86, '48th and Woodland Playground', 'picnic table', 39.9423051599285, -75.2101886105218, '0101000020E6100000B30BEEBA73CD52C05B5F9A749DF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (87, 'Allens Lane Art Center', 'picnic table', 40.0516981733727, -75.2025962461448, '0101000020E6100000FEDE3E56F7CC52C008F3B50B9E064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (88, 'Allens Lane Art Center', 'picnic table', 40.0512589552888, -75.2033334987809, '0101000020E61000007FDC816A03CD52C0D84B48A78F064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (89, 'Fletcher B Amos Playground', 'picnic table', 39.982052008963, -75.1600667271719, '0101000020E6100000639883883ECA52C0CDBB56E1B3FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (90, 'Athletic Recreation Center', 'picnic table', 39.9781463295056, -75.1785787414935, '0101000020E61000006D9E87D56DCB52C0E9F61FE633FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (91, 'Giuseppe Bardascino Park', 'picnic table', 39.9378359467059, -75.159922585264, '0101000020E61000007166F02B3CCA52C0BA0E20020BF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (92, 'Campbell Square', 'picnic table', 39.9857898343233, -75.1036231152343, '0101000020E61000009FC2D8C2A1C652C0EC927D5C2EFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (93, 'Campbell Square', 'picnic table', 39.9859855581598, -75.1036126993202, '0101000020E6100000F4C12897A1C652C0F44F57C634FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (94, 'Campbell Square', 'picnic table', 39.9863076640064, -75.1032831004244, '0101000020E610000059A3B8309CC652C0CF595C543FFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (95, 'Campbell Square', 'picnic table', 39.9862331834278, -75.1034338338685, '0101000020E6100000F770F1A89EC652C0B48692E33CFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (96, 'Carousel House Recreation Center', 'picnic table', 39.9790217839764, -75.2126708020627, '0101000020E610000019EBFE659CCD52C00720F89550FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (97, 'Carroll Park', 'picnic table', 39.9708545206265, -75.236327487133, '0101000020E6100000741853FD1FCF52C0DEA1FFF544FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (98, 'Carroll Park', 'picnic table', 39.9713019673174, -75.2366027960309, '0101000020E610000012C60D8024CF52C09815749F53FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (99, 'Pennypack on the Delaware', 'picnic table', 40.0268023116616, -75.0134415978078, '0101000020E610000064BF253ADCC052C09A0516426E034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (100, 'Pennypack on the Delaware', 'picnic table', 40.0268968732478, -75.012891970734, '0101000020E6100000BF2BD838D3C052C0637B535B71034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (101, 'Pennypack on the Delaware', 'picnic table', 40.0273845275813, -75.0120813849063, '0101000020E6100000074400F1C5C052C06530115681034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (102, 'Pennypack on the Delaware', 'picnic table', 40.0277038423522, -75.0121297441402, '0101000020E61000000699D5BBC6C052C02970ACCC8B034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (103, 'Pennypack on the Delaware', 'picnic table', 40.0277620342912, -75.0114012619196, '0101000020E6100000FBC45BCCBAC052C0F2ACD2B48D034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (104, 'Penn Treaty Park', 'picnic table', 39.9669122506194, -75.1283970282154, '0101000020E6100000AE452BA837C852C08C41D7C7C3FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (105, 'Penn Treaty Park', 'picnic table', 39.9667394826128, -75.1283942785016, '0101000020E61000001BCAA29C37C852C077C98E1EBEFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (106, 'Joseph E Mander Playground', 'picnic table', 39.9888780252063, -75.1872711564678, '0101000020E6100000DA202940FCCB52C03FFF1C8E93FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (107, 'Cobbs Creek Park', 'picnic table', 39.9729175850214, -75.2551798638366, '0101000020E6100000A971ECDD54D052C063AF3C9088FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (108, 'Cobbs Creek Park', 'picnic table', 39.9730326351454, -75.2554379424459, '0101000020E61000009C3D621859D052C0F2F158558CFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (109, 'Cobbs Creek Park', 'picnic table', 39.9738248063043, -75.2564353952987, '0101000020E61000001016017069D052C0258E8F4AA6FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (110, 'Cobbs Creek Park', 'picnic table', 39.9732849727454, -75.2561900745439, '0101000020E610000074EE0D6B65D052C09BD01B9A94FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (111, 'West Fairmount Park', 'picnic table', 39.9783163485439, -75.2076527469056, '0101000020E61000009538BF2E4ACD52C0B011597839FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (112, 'West Fairmount Park', 'picnic table', 39.9784529386195, -75.2073656223639, '0101000020E61000008797757A45CD52C0DE0526F23DFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (113, 'West Fairmount Park', 'picnic table', 39.9789006293717, -75.2070425307673, '0101000020E6100000B4A1502F40CD52C0B797A69D4CFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (114, 'East Fairmount Park', 'picnic table', 39.9723856757768, -75.1872686912262, '0101000020E61000006618D235FCCB52C0B547422277FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (115, 'East Fairmount Park', 'picnic table', 39.9720668542449, -75.1878364473348, '0101000020E61000003093298305CC52C0F440CAAF6CFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (116, 'East Fairmount Park', 'picnic table', 39.971737685354, -75.1878264902085, '0101000020E61000002631665905CC52C06E7185E661FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (117, 'East Fairmount Park', 'picnic table', 39.972377199608, -75.188165509285, '0101000020E6100000502759E70ACC52C0A1D827DB76FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (118, 'East Fairmount Park', 'picnic table', 39.9717336642212, -75.1887409936941, '0101000020E61000002AD51A5514CC52C04B20CAC461FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (119, 'East Fairmount Park', 'picnic table', 39.9713696529343, -75.188484184235, '0101000020E610000090C6F71F10CC52C000D73DD755FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (120, 'West Fairmount Park', 'picnic table', 39.9947231260578, -75.2131707078491, '0101000020E610000055ABC096A4CD52C01F7F5F1653FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (121, 'West Fairmount Park', 'picnic table', 39.994656786014, -75.2134683662624, '0101000020E6100000F7F43877A9CD52C05956DFE950FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (122, 'West Fairmount Park', 'picnic table', 39.9945065845128, -75.2138690289247, '0101000020E6100000F836B907B0CD52C0CF11E4FD4BFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (123, 'West Fairmount Park', 'picnic table', 39.994342872498, -75.2140105279263, '0101000020E61000005D9C3659B2CD52C0DF3193A046FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (124, 'Chamounix Tennis Courts', 'picnic table', 39.9992621860392, -75.2022303843913, '0101000020E6100000F6CDB557F1CC52C07C95C4D2E7FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (125, 'West Fairmount Park', 'picnic table', 39.9870761964939, -75.2228650917193, '0101000020E6100000AF16F26B43CE52C0FA4C478358FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (126, 'West Fairmount Park', 'picnic table', 39.986662132393, -75.2229787862409, '0101000020E6100000D0A6D04845CE52C02F6ADBF14AFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (127, 'West Fairmount Park', 'picnic table', 39.9821503012936, -75.2052642170797, '0101000020E61000005ED9860C23CD52C002E8DF19B7FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (128, 'West Fairmount Park', 'picnic table', 39.9913124266278, -75.2000303876696, '0101000020E6100000D14F414CCDCC52C00E3E5A53E3FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (129, 'West Fairmount Park', 'picnic table', 39.9907739030074, -75.2006729462417, '0101000020E6100000345357D3D7CC52C0D392E3ADD1FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (130, 'Belmont Grove', 'picnic table', 39.9925280627273, -75.2150034372388, '0101000020E6100000F8DDC69DC2CD52C054E3D8280BFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (131, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9034494458027, -75.1831631204315, '0101000020E61000008B05CFF1B8CB52C0EDA73F3BA4F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (132, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9022529055226, -75.1836174781935, '0101000020E61000002AF48563C0CB52C064F8F0057DF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (133, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9018839305102, -75.1836076911793, '0101000020E6100000303A793AC0CB52C0252AC1EE70F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (134, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9012620955558, -75.1826472302798, '0101000020E61000006E30027EB0CB52C0AFC46C8E5CF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (135, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9013451222341, -75.1821593919941, '0101000020E610000088D1DD7FA8CB52C0C933E7465FF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (136, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9016155973215, -75.1810218372423, '0101000020E610000052B49DDC95CB52C09907D02368F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (137, 'Franklin Delano Roosevelt Park', 'picnic table', 39.8996271852201, -75.1787516912159, '0101000020E610000020F8EEAA70CB52C0728ECDFB26F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (138, 'Franklin Delano Roosevelt Park', 'picnic table', 39.8997772924194, -75.1784662933932, '0101000020E6100000FA63E3FD6BCB52C0F84FFEE62BF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (139, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9017529952654, -75.1762908662685, '0101000020E61000003B4D7C5948CB52C012DE63A46CF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (140, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9013188143416, -75.1762824897812, '0101000020E6100000EF1D5A3648CB52C0EF6E376A5EF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (141, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9013759019535, -75.1771857378316, '0101000020E61000007B53D90257CB52C07A251A4960F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (142, 'Franklin Delano Roosevelt Park', 'picnic table', 39.8998468795712, -75.1779875244424, '0101000020E6100000DF24C92564CB52C03E95BB2E2EF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (143, 'Franklin Delano Roosevelt Park', 'picnic table', 39.899927908461, -75.1776388756875, '0101000020E6100000DE64726F5ECB52C081CC73D630F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (144, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9000533741443, -75.1771098986747, '0101000020E6100000C4A6C1C455CB52C0574DEFF234F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (145, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9026076994476, -75.1756993459701, '0101000020E6100000B13778A83ECB52C0641F2BA688F34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (146, 'Fernhill Park', 'picnic table', 40.0203230387726, -75.1669620019014, '0101000020E6100000D6756481AFCA52C01C7101F299024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (147, 'Fernhill Park', 'picnic table', 40.0196042814881, -75.1689983699981, '0101000020E6100000070E8ADED0CA52C02EEDA16482024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (148, 'Fernhill Park', 'picnic table', 40.0192956889059, -75.1695521656841, '0101000020E610000011A553F1D9CA52C0FE66F84778024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (149, 'Blue Bell Park', 'picnic table', 40.032008210019, -75.1958168942437, '0101000020E6100000FC31954388CC52C0189E53D818044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (150, 'Blue Bell Park', 'picnic table', 40.0315426295317, -75.1954070874608, '0101000020E61000003F83BA8C81CC52C05E22C19609044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (151, 'Blue Bell Park', 'picnic table', 40.0312256661462, -75.195248469311, '0101000020E61000003A926FF37ECC52C06672DF33FF034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (152, 'Blue Bell Park', 'picnic table', 40.0307159518892, -75.1949477921266, '0101000020E61000001DE74D067ACC52C0316A1480EE034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (153, 'Blue Bell Park', 'picnic table', 40.0305924820138, -75.1952236583542, '0101000020E61000005A025F8B7ECC52C05AE05674EA034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (154, 'Blue Bell Park', 'picnic table', 40.0304043876405, -75.1951223304549, '0101000020E61000007A015FE27CCC52C012497D4AE4034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (155, 'David P Montgomery Field', 'picnic table', 40.0220832181544, -75.2033376281256, '0101000020E61000001FB6D37B03CD52C0BDE1759FD3024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (156, 'Salvatore Pachella Memorial Field', 'picnic table', 40.0457984685605, -75.2158750594495, '0101000020E6100000E416A0E5D0CD52C04D5666B9DC054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (157, 'Wissahickon Valley Park', 'picnic table', 40.0534591664915, -75.2177013543251, '0101000020E6100000C247A9D1EECD52C04FE0FDBFD7064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (158, 'Wissahickon Valley Park', 'picnic table', 40.0588751822378, -75.2204400102079, '0101000020E6100000A9A46AB01BCE52C0F220D33889074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (159, 'Wissahickon Valley Park', 'picnic table', 40.066407009595, -75.2206872354929, '0101000020E61000008CC55ABD1FCE52C0C4375F0680084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (160, 'Wissahickon Valley Park', 'picnic table', 40.071299073198, -75.2246205231483, '0101000020E6100000AC3BC22E60CE52C06DCFF95320094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (161, 'Wissahickon Valley Park', 'picnic table', 40.073083895032, -75.2247419964285, '0101000020E6100000AF2C412C62CE52C06C8325D05A094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (162, 'Cecil B Moore Recreation Center', 'picnic table', 39.9941775247336, -75.16769781572, '0101000020E610000032889E8FBBCA52C01493893541FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (163, 'Corporal Jimmy OConnor Memorial Playground', 'picnic table', 40.0794912345923, -74.9746220445718, '0101000020E610000061D9233560BE52C04072CEC42C0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (164, 'Charles H Chew Playground', 'picnic table', 39.9378176919844, -75.1740170197606, '0101000020E61000006D34481823CB52C07357FE680AF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (165, 'Clarence H Clark Park', 'picnic table', 39.9489803517363, -75.2098476578666, '0101000020E610000079EBDE246ECD52C083A02B3078F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (166, 'Clayborne and Lewis Playground', 'picnic table', 39.9736449149696, -75.1990185783011, '0101000020E610000060466BB8BCCC52C006DB8565A0FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (167, 'Cloverly Park', 'picnic table', 40.0255510798983, -75.1807272470245, '0101000020E6100000D9DD030991CB52C03545FE4145034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (168, 'Jose Manuel Collazo Park', 'picnic table', 39.9995827545548, -75.1304966947294, '0101000020E61000005406CF0E5AC852C0AF3AE453F2FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (169, 'Rainbow De Colores Playground', 'picnic table', 39.9867956260122, -75.1415436502101, '0101000020E6100000F726190D0FC952C075C7AE514FFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (170, 'Rainbow De Colores Playground', 'picnic table', 39.9869521286919, -75.1418738995759, '0101000020E610000068B5437614C952C082B9857254FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (171, 'John Dickinson Square', 'picnic table', 39.9277863215471, -75.1518773330698, '0101000020E610000077A2B45BB8C952C0485CC2B3C1F64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (172, 'East Poplar Playground', 'picnic table', 39.966635084063, -75.1512693969888, '0101000020E6100000F63CD665AEC952C0C09BCCB2BAFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (173, 'Fishtown Recreation Center', 'picnic table', 39.9720161628613, -75.1277840987778, '0101000020E6100000C44C5B9D2DC852C01B568F066BFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (174, 'Eileen Fitzpatrick Playground', 'picnic table', 40.0962694110641, -74.9718461805555, '0101000020E61000009E8E52BA32BE52C010105A8E520C4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (175, 'Ford Road Playground', 'picnic table', 39.9994335541914, -75.206425564013, '0101000020E6100000A19F911336CD52C078E34E70EDFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (176, 'Fort Mifflin', 'picnic table', 39.8751690250014, -75.2114557603636, '0101000020E610000000D4BD7D88CD52C0366DE28905F04340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (177, 'Fox Chase Recreation Center', 'picnic table', 40.0741729090501, -75.0825033794615, '0101000020E61000002F2641BC47C552C0474F757F7E094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (178, 'Frankford and Solly Playground', 'picnic table', 40.0439881692997, -75.0209478455463, '0101000020E6100000C1E2A13557C152C0CD468267A1054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (179, 'Franklin Square', 'picnic table', 39.9554367794193, -75.1507854974422, '0101000020E61000006C0E3778A6C952C030809CC04BFA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (180, 'Franklin Square', 'picnic table', 39.9559327062307, -75.1510492883223, '0101000020E61000006A5BA2CAAAC952C00438BF005CFA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (181, 'Susan Gorgas Park', 'picnic table', 40.0369441080601, -75.2204941033764, '0101000020E610000099BD4C931CCE52C0F2F2A395BA044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (182, 'Thomas I Guerin Recreation Center', 'picnic table', 39.9233547027595, -75.1728086028955, '0101000020E6100000D579D04B0FCB52C0DC7AA57C30F64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (183, 'Eric W (Hank) Gathers Jr Recreation Center', 'picnic table', 39.9874269872038, -75.1758189156207, '0101000020E6100000FB26FB9D40CB52C0339DEC0164FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (184, 'Eric W (Hank) Gathers Jr Recreation Center', 'picnic table', 39.9875907549378, -75.1747983477085, '0101000020E610000062B368E52FCB52C01825B55F69FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (185, 'Hawthorne Cultural Center', 'picnic table', 39.9384829545021, -75.1636364143557, '0101000020E6100000EA05DE0479CA52C051B89E3520F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (186, 'Nelson M Herron Playground and Recreation Center', 'picnic table', 39.930583778938, -75.1484769084338, '0101000020E6100000CD7B4AA580C952C0085D885E1DF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (187, 'Horton Street Play Lot', 'picnic table', 39.9662688444682, -75.2432377257483, '0101000020E6100000834FF73491CF52C03C118FB2AEFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (188, 'Inn Yard Park', 'picnic table', 40.0092177077475, -75.1950789862374, '0101000020E6100000B281922C7CCC52C0E9A8BC0B2E014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (189, 'Kingsessing Recreation Center', 'picnic table', 39.9418580742628, -75.217327088626, '0101000020E6100000C08BE0AFE8CD52C054372DCE8EF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (190, 'Lardners Point Park', 'picnic table', 40.0142242750164, -75.0478465960531, '0101000020E610000079512BEB0FC352C09C00DE19D2014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (191, 'Lardners Point Park', 'picnic table', 40.0141973665024, -75.0475946649252, '0101000020E610000057547ECA0BC352C098682438D1014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (192, 'Lardners Point Park', 'picnic table', 40.0147071560189, -75.046484217167, '0101000020E6100000CC20F098F9C252C0260F91ECE1014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (193, 'John A Lee Cultural Center', 'picnic table', 39.9622487969771, -75.2102763091137, '0101000020E610000015B1C32A75CD52C0E5D0F4F72AFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (194, 'Louis I Kahn Park', 'picnic table', 39.9451113436219, -75.1599883893415, '0101000020E610000089FDF03F3DCA52C0A4F79368F9F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (195, 'Malcolm X Memorial Park', 'picnic table', 39.9530552227429, -75.225559096674, '0101000020E6100000EEE16B8F6FCE52C03B7BAAB6FDF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (196, 'Mantua Community Garden', 'picnic table', 39.9635481618656, -75.1918543111415, '0101000020E6100000C2FC4D5747CC52C0B6AAD18B55FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (197, 'Mario Lanza Park', 'picnic table', 39.9373300758474, -75.1472791231914, '0101000020E6100000665F6A056DC952C030A9926EFAF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (198, 'Dr Martin Luther King Jr Recreation Center', 'picnic table', 39.9805649208834, -75.1698010653509, '0101000020E610000084A04905DECA52C04766BD2683FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (199, 'Max Myers Playground', 'picnic table', 40.0393351401707, -75.0712397822867, '0101000020E61000001DC64D318FC452C0F14E12EF08054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (200, 'Mifflin Square', 'picnic table', 39.9189841659508, -75.156709666264, '0101000020E61000008BE4FA8707CA52C07826ED45A1F54340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (201, 'Mount Airy Playground', 'picnic table', 40.0576814926327, -75.188334667192, '0101000020E6100000BB12D9AC0DCC52C091386E1B62074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (202, 'Mount Airy Playground', 'picnic table', 40.0575971990891, -75.1876291462282, '0101000020E6100000E6B4AD1D02CC52C0E63653585F074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (203, 'Mount Airy Playground', 'picnic table', 40.0576660296933, -75.188021787764, '0101000020E61000007058898C08CC52C0BBCFB79961074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (204, 'Fish Hatchery at Pleasant Hill Park', 'picnic table', 40.0427638499947, -74.9931476088854, '0101000020E6100000DB10FDBA8FBF52C0D2962C4979054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (205, 'Fish Hatchery at Pleasant Hill Park', 'picnic table', 40.0431492492045, -74.9930041510627, '0101000020E6100000D26648618DBF52C0131723EA85054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (206, 'Hawthorne Cultural Center', 'picnic table', 39.9389629267984, -75.1646248557405, '0101000020E6100000E8E0B03689CA52C0B760EBEF2FF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (207, 'Charles A Russo Playground', 'picnic table', 40.0301426397453, -75.0343562241594, '0101000020E61000006FCB72E432C252C0E9F5C9B6DB034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (208, 'William H (Billy) Markward Memorial Playground', 'picnic table', 39.9478152292205, -75.1833689981312, '0101000020E6100000B9845251BCCB52C08F136A0252F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (209, 'William H (Billy) Markward Memorial Playground', 'picnic table', 39.9480701551303, -75.1830850973736, '0101000020E6100000B2668EAAB7CB52C0954CE35C5AF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (210, 'Haddington-Marshall L Shepard Sr Recreation Center', 'picnic table', 39.9668996201693, -75.2344052554166, '0101000020E61000009781E67E00CF52C02C92E35DC3FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (211, 'Thomas B Smith Recreation Center', 'picnic table', 39.9259207076573, -75.1869964600657, '0101000020E6100000CC1C00C0F7CB52C0E409DB9184F64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (212, 'Starr Garden Playground', 'picnic table', 39.9426897104079, -75.152770951411, '0101000020E6100000B305D0FFC6C952C0233D720EAAF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (213, 'Torresdale and Enfield Fields', 'picnic table', 40.0388186401991, -75.0206843573764, '0101000020E61000001B9E7BE452C152C0AF105B02F8044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (214, 'Triangle Park', 'picnic table', 39.983532754542, -75.231784872931, '0101000020E61000008E3C3890D5CE52C0BEA6BB66E4FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (215, 'Ernest L Tustin Recreation Center', 'picnic table', 39.9821052160419, -75.2411926445716, '0101000020E6100000211E46B36FCF52C0C410AC9FB5FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (216, 'Vernon Park', 'picnic table', 40.0357546967114, -75.176963310991, '0101000020E61000001653EC5D53CB52C0E586229C93044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (217, 'Verree and Susquehanna Playground', 'picnic table', 40.0807922461985, -75.0672262977702, '0101000020E6100000AB96876F4DC452C0B2987B66570A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (218, 'Parkside Evans Recreation Center', 'picnic table', 39.9821965048874, -75.2262903944324, '0101000020E61000001CDFB48A7BCE52C0525E759DB8FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (219, 'West Mill Creek Playground', 'picnic table', 39.9670061589245, -75.2224279998287, '0101000020E6100000A73EA6423CCE52C03FCE99DBC6FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (220, 'Wissahickon Environmental Center', 'picnic table', 40.0809101940743, -75.2342562884721, '0101000020E6100000AE77160EFECE52C027BBE6435B0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (221, 'Wissahickon Environmental Center', 'picnic table', 40.0813209189519, -75.2343905735552, '0101000020E610000042FA514100CF52C086B04FB9680A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (222, 'Wissahickon Environmental Center', 'picnic table', 40.0812759471981, -75.2337504269997, '0101000020E6100000F2D859C4F5CE52C069950F40670A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (223, 'Wissinoming Park', 'picnic table', 40.0244968799198, -75.0693678706666, '0101000020E6100000FFF9EF8570C452C0070EB9B622034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (224, 'Woodside Park', 'picnic table', 40.0023230970908, -75.2089680705318, '0101000020E6100000E8359DBB5FCD52C0E5038D1F4C004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (225, 'William Lanier Park', 'picnic table', 39.9334286826292, -75.1940266591335, '0101000020E6100000F4E1CAEE6ACC52C0388550977AF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (226, 'Stenton Park', 'picnic table', 40.0243359958654, -75.1526699733037, '0101000020E6100000EB9A4758C5C952C0C22D21711D034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (227, 'Stenton Park', 'picnic table', 40.0240129771908, -75.1525199790529, '0101000020E6100000348128E3C2C952C067DB73DB12034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (228, 'Fernhill Park', 'picnic table', 40.016071150033, -75.1701259886642, '0101000020E6100000CB601D58E3CA52C082E6939E0E024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (229, 'Disston Recreation Center', 'picnic table', 40.0279835974537, -75.0440577573673, '0101000020E6100000C5C1A0D7D1C252C0ACF16DF794034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (230, 'Garland and Bingham Fields', 'picnic table', 40.0342446308556, -75.1104689169582, '0101000020E6100000D76338EC11C752C051CBC82062044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (231, 'Mount Airy Playground', 'picnic table', 40.0576633037348, -75.1877070238472, '0101000020E6100000CE29526403CC52C032DCD98261074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (232, 'Mount Airy Playground', 'picnic table', 40.0577580244369, -75.1884807762762, '0101000020E6100000FB81AC1110CC52C0DF046D9D64074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (233, 'Water Tower Recreation Center', 'picnic table', 40.075869632944, -75.2004581561743, '0101000020E61000000C3F724ED4CC52C083209C18B6094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (234, 'Water Tower Recreation Center', 'picnic table', 40.075358729772, -75.2004674321435, '0101000020E61000000B3E5A75D4CC52C05FEBD75AA5094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (235, 'Corporal George J Reed Jr Memorial Playground', 'picnic table', 40.0027542627273, -75.1332141598939, '0101000020E6100000F006AF9486C852C04F2B6E405A004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (236, 'Stephen E Fotterall Square', 'picnic table', 39.9902025836948, -75.1510057452963, '0101000020E610000091630014AAC952C023B150F5BEFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (237, '37th and Mount Vernon Playground', 'picnic table', 39.9640265000122, -75.1964475623173, '0101000020E610000008E2CB9892CC52C0CF03693865FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (238, 'East Fairmount Park', 'picnic table', 39.982367744086, -75.1893338458756, '0101000020E6100000F103B50B1ECC52C051BFEA39BEFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (239, 'Clarence H Clark Park', 'picnic table', 39.947852653234, -75.2108936688046, '0101000020E6100000C09C28487FCD52C08F88593C53F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (240, 'Clarence H Clark Park', 'picnic table', 39.9477482336131, -75.2107771469102, '0101000020E61000004E2E6E5F7DCD52C0E21A6AD04FF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (241, 'Clarence H Clark Park', 'picnic table', 39.9470968957913, -75.209286124865, '0101000020E61000005073A1F164CD52C08BC898783AF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (242, 'Cobbs Creek Park', 'picnic table', 39.9534127662704, -75.2493542178093, '0101000020E610000014A7646BF5CF52C0315CF56D09FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (243, 'Bartrams Garden', 'picnic table', 39.9304182740947, -75.2135982828577, '0101000020E6100000C2D62198ABCD52C0336B2DF217F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (244, 'Bartrams Garden', 'picnic table', 39.9304159918273, -75.2134088607197, '0101000020E6100000EF5DA37DA8CD52C06E4908DF17F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (245, 'Jacob Stinger Park', 'picnic table', 39.9364231161223, -75.1973904335459, '0101000020E6100000DE277C0BA2CC52C05A7B71B6DCF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (246, 'Thomas B Smith Recreation Center', 'picnic table', 39.9258681962043, -75.1867973007557, '0101000020E6100000846EAA7CF4CB52C04F8D5BD982F64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (247, 'Thomas B Smith Recreation Center', 'picnic table', 39.9262624304845, -75.1872053848718, '0101000020E6100000356A4B2CFBCB52C0E2386FC48FF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (248, 'Thomas B Smith Recreation Center', 'picnic table', 39.9262097415656, -75.1873054640878, '0101000020E6100000A1A70ED0FCCB52C064A1720A8EF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (249, 'Thomas B Smith Recreation Center', 'picnic table', 39.9262309692302, -75.1875385005152, '0101000020E6100000099D7BA100CC52C06BB184BC8EF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (250, 'Thomas I Guerin Recreation Center', 'picnic table', 39.9232493674887, -75.1727252819848, '0101000020E61000004B5457EE0DCB52C055B507092DF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (251, 'Franklin Square', 'picnic table', 39.955743131972, -75.1500043895907, '0101000020E61000001BE302AC99C952C022997BCA55FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (252, 'Shot Tower Recreation Center', 'picnic table', 39.9348694014566, -75.1463822543125, '0101000020E61000002ABFAC535EC952C0C3A4F0CCA9F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (253, 'Victor J Moss Memorial Field', 'picnic table', 40.0159999098451, -75.0627750364253, '0101000020E6100000EB1C968104C452C007C3F8480C024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (254, 'Karen Donnelly Park', 'picnic table', 39.9290742514563, -75.1493640716562, '0101000020E61000007DBD522E8FC952C0BEC7B2E7EBF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (255, 'Bartrams Garden', 'picnic table', 39.9333643608504, -75.2084898204689, '0101000020E61000009F1DB0E557CD52C05D8DBE7B78F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (256, 'Bartrams Garden', 'picnic table', 39.9310207327893, -75.2134071157234, '0101000020E610000001B15176A8CD52C02F9DF7AF2BF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (257, 'Bartrams Garden', 'picnic table', 39.9302469196217, -75.2125034601388, '0101000020E610000050E51CA899CD52C06F7DC05412F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (258, 'Roberto Clemente Playground', 'picnic table', 39.9656168034295, -75.1675309581077, '0101000020E6100000F888C4D3B8CA52C05099D75499FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (259, 'Pennypack on the Delaware', 'picnic table', 40.0329861914802, -75.00782961054, '0101000020E61000006C4DC44780C052C043D03AE438044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (260, 'Pine Road Picnic Shelter', 'picnic table', 40.0884393967844, -75.0674991205384, '0101000020E610000028CED4E751C452C0F96E6EFB510B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (261, 'Pennypack Park', 'picnic table', 40.0877865697179, -75.0592863899755, '0101000020E6100000BB822459CBC352C0B3FB1E973C0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (262, 'Wissahickon Valley Park', 'picnic table', 40.054368792122, -75.2182381709891, '0101000020E6100000C5C83B9DF7CD52C0230B7C8EF5064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (263, 'Wissahickon Valley Park', 'picnic table', 40.036644300236, -75.2044771654692, '0101000020E6100000049E642716CD52C0998CABC2B0044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (264, 'Glen Foerd on the Delaware', 'picnic table', 40.0531245099825, -74.9802407869074, '0101000020E61000003F7EDA43BCBE52C0D57EB0C8CC064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (265, 'Pennypack Park', 'picnic table', 40.0668560127731, -75.0504980537075, '0101000020E6100000DD4B305C3BC352C06233E2BC8E084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (266, 'Pennypack Park', 'picnic table', 40.0728095355157, -75.068768482581, '0101000020E610000095EBEBB366C452C03EF0A6D251094440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (267, 'Verree and Susquehanna Playground', 'picnic table', 40.0804926710794, -75.0675212314871, '0101000020E61000007541924452C452C046ED76954D0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (268, 'Pennypack Park', 'picnic table', 40.0881962149527, -75.0677235601093, '0101000020E6100000A4F5329555C452C02A6D79034A0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (269, 'Pennypack Park', 'picnic table', 40.089702646189, -75.0688476239762, '0101000020E6100000A558DDFF67C452C08ADF55607B0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (270, 'Burholme Park', 'picnic table', 40.0689754983393, -75.0900956892709, '0101000020E610000076BBB520C4C552C0DACB6A30D4084440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (271, 'Fox Chase Farm', 'picnic table', 40.0902694777943, -75.074883253751, '0101000020E61000003B7821E3CAC452C00D7A43F38D0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (272, 'Fox Chase Farm', 'picnic table', 40.0907779498259, -75.0739220561001, '0101000020E6100000CB599323BBC452C09FD9A29C9E0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (273, 'Ann P Nichols Park', 'picnic table', 39.963598207947, -75.2295329245527, '0101000020E6100000C813DDAAB0CE52C0ECCEA22F57FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (274, 'John J McCreesh Sr Playground', 'picnic table', 39.9256319412531, -75.2406705228537, '0101000020E61000002531562567CF52C054E8811B7BF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (275, 'Gold Star Park', 'picnic table', 39.9328892521961, -75.1550785664018, '0101000020E610000067C0A6CEECC952C06F7C3EEA68F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (276, 'Historic Rittenhouse Town', 'picnic table', 40.0290638570426, -75.1919757396993, '0101000020E610000092E89C5449CC52C02EBF4D5DB8034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (277, 'Hancock Playground', 'picnic table', 39.9724026368279, -75.1372195400143, '0101000020E6100000F32E7734C8C852C029DC89B077FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (278, 'Hancock Playground', 'picnic table', 39.9727594899265, -75.1374011352252, '0101000020E61000006F8E212ECBC852C0D20D0A6283FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (279, 'Miles Mack Playground', 'picnic table', 39.9672009914504, -75.1960874799816, '0101000020E6100000446B80B28CCC52C01878F93DCDFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (280, '8th and Diamond Playground', 'picnic table', 39.9833228554078, -75.1472777132254, '0101000020E6100000E66E80FF6CC952C063B1F885DDFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (281, 'Fisher Park', 'picnic table', 40.0435518823966, -75.1306880139973, '0101000020E61000003F8642315DC852C04C49AB1B93054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (282, 'Carmella DiTizio Playground', 'picnic table', 40.0111590447148, -75.0731958128124, '0101000020E6100000F08E7D3DAFC452C0660DDAA86D014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (283, 'Dr Martin Luther King Jr Recreation Center', 'picnic table', 39.9803390412827, -75.1694186977754, '0101000020E6100000AE9185C1D7CA52C08DA6ECBF7BFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (284, 'Columbus Square', 'picnic table', 39.9329591616671, -75.1643945956735, '0101000020E6100000A303E97085CA52C090EEAF346BF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (285, 'Jacob Stinger Park', 'picnic table', 39.9359853188519, -75.1982212186152, '0101000020E6100000D6D40CA8AFCC52C0A500EF5DCEF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (286, 'Marie Dendy Recreation Center', 'picnic table', 39.9752066645697, -75.1511344715391, '0101000020E6100000C123EB2FACC952C084956D92D3FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (287, 'Benson Park', 'picnic table', 39.9735685396768, -75.1431156424344, '0101000020E610000050F382CE28C952C0C529D7E49DFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (288, 'Von Colln Field', 'picnic table', 39.9638095262565, -75.1762185897108, '0101000020E610000054F0552A47CB52C0266C4D1C5EFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (289, 'Carousel House Recreation Center', 'picnic table', 39.9785463813306, -75.2128337223652, '0101000020E6100000D94255119FCD52C090B7000241FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (290, 'Woodside Park', 'picnic table', 40.002217733132, -75.2083496217038, '0101000020E610000084D6A69955CD52C0F8A2B1AB48004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (291, 'Carousel House Recreation Center', 'picnic table', 39.9794889575187, -75.2135977431533, '0101000020E6100000F155DE95ABCD52C000ABE7E45FFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (292, 'Jacob Stinger Park', 'picnic table', 39.9364802915055, -75.1977605174424, '0101000020E6100000BBB6BA1BA8CC52C0ADAE1096DEF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (293, 'Stephen E Fotterall Square', 'picnic table', 39.9891584751248, -75.1502967562777, '0101000020E6100000163A49769EC952C0739CB2BE9CFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (294, 'Stephen E Fotterall Square', 'picnic table', 39.9898055676103, -75.1501562637975, '0101000020E6100000309304299CC952C07924E7F2B1FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (295, 'Frank Glavin Playground', 'picnic table', 39.9865776372698, -75.1013488105719, '0101000020E610000045B9B87F7CC652C0F5840F2D48FE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (296, 'Frank Glavin Playground', 'picnic table', 39.9862249234854, -75.1013945962286, '0101000020E6100000C0B2C23F7DC652C0596F489E3CFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (297, 'George Jacobs Playground', 'picnic table', 40.0523435660869, -75.0024913387225, '0101000020E610000088956ED128C052C0E73FA831B3064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (298, '12th and Cambria Playground', 'picnic table', 39.9968650042839, -75.149832408493, '0101000020E6100000EF96ABDA96C952C08FF6BF4599FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (299, 'Joseph A Ferko Playground', 'picnic table', 40.0148147624698, -75.1054064783942, '0101000020E6100000565FD0FABEC652C024273C73E5014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (300, 'Charles J Ziehler Playground', 'picnic table', 40.0337361522356, -75.1181887407935, '0101000020E6100000AA1D826790C752C0BB455B7751044440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (301, 'Northwood Park', 'picnic table', 40.0224583500984, -75.0930362030078, '0101000020E6100000CD501E4EF4C552C0ED984BEADF024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (302, 'Lawncrest Recreation Center', 'picnic table', 40.0458483595947, -75.1006749813665, '0101000020E6100000A61F7A7571C652C06A84EA5BDE054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (303, 'Lawncrest Recreation Center', 'picnic table', 40.0462405358062, -75.1006389653349, '0101000020E610000044346ADE70C652C0C184BA35EB054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (304, 'Lawncrest Recreation Center', 'picnic table', 40.045850925942, -75.1011315350532, '0101000020E610000075E966F078C652C0C3B47171DE054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (305, 'Lawncrest Recreation Center', 'picnic table', 40.0457041019978, -75.1008176373304, '0101000020E61000006BCCD1CB73C652C0D2AFCBA1D9054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (306, 'Alfred J Simpson Memorial Recreation Center', 'picnic table', 40.0216119422285, -75.0933109017385, '0101000020E6100000F0D449CEF8C552C088891C2EC4024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (307, 'Boniface Piccoli Playground', 'picnic table', 40.0129796307461, -75.0972901524387, '0101000020E61000009DBC79003AC652C0CAC80851A9014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (308, 'Womrath Park', 'picnic table', 40.0080691852885, -75.0908115084572, '0101000020E610000024BB12DBCFC552C0B1753B6908014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (309, 'Juniata Park Older Adult Center', 'picnic table', 40.0038436499827, -75.1043475308371, '0101000020E6100000471744A1ADC652C08A7CDFF27D004440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (310, 'Konrad Square', 'picnic table', 39.9792032075161, -75.127701044561, '0101000020E61000007D8300412CC852C0C135DC8756FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (311, 'Hagert Street Playground', 'picnic table', 39.9834656547939, -75.1282409967639, '0101000020E6100000E0C6B91935C852C01E0ADC33E2FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (312, 'Thomas P Stokley Recreation Center', 'picnic table', 39.9820195457894, -75.1069271050162, '0101000020E61000006FC6C8E4D7C652C0609904D1B2FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (313, 'Colonel Thomas J Powers Park', 'picnic table', 39.9825193425726, -75.1089279835066, '0101000020E6100000EDB113ADF8C652C0B4049E31C3FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (314, 'Michael Palmer Playground', 'picnic table', 40.095947800516, -74.9892688809353, '0101000020E610000054A46C2E50BF52C070AB7C04480C4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (315, 'Saul High School Farm', 'picnic table', 40.0493692587103, -75.2190748566157, '0101000020E610000095228C5205CE52C054CB5BBB51064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (316, 'Harry S McDevitt Playground', 'picnic table', 40.0089181660145, -75.1873270397329, '0101000020E6100000CC538D2AFDCB52C0B1AFFF3A24014440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (317, 'Marie Dendy Recreation Center', 'picnic table', 39.9762371579378, -75.1508879754221, '0101000020E61000000BF30926A8C952C0CE3DD556F5FC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (318, 'East Poplar Playground', 'picnic table', 39.9661688913867, -75.1514598124086, '0101000020E6100000023D7F84B1C952C09075176CABFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (319, 'Waterloo Playground', 'picnic table', 39.9890750120801, -75.1327869064907, '0101000020E6100000BB2DA7947FC852C061168F029AFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (320, 'Waterloo Playground', 'picnic table', 39.9881531265144, -75.1331564457793, '0101000020E6100000EBF79CA285C852C0E5E838CD7BFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (321, 'Norris Square', 'picnic table', 39.9825337139329, -75.1340380678874, '0101000020E6100000B57F671494C852C095472CAAC3FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (322, 'Delancey Park', 'picnic table', 39.9442445128645, -75.1480083805903, '0101000020E6100000D58A24F878C952C01A171301DDF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (323, 'Schuylkill River Park', 'picnic table', 39.948950504406, -75.1816674976774, '0101000020E61000005151B670A0CB52C026F9CA3577F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (324, 'Schuylkill River Park', 'picnic table', 39.9482180390362, -75.1828204641232, '0101000020E6100000B79C9A54B3CB52C0A1916D355FF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (325, 'East Fairmount Park', 'picnic table', 39.9925745969281, -75.187605297399, '0101000020E6100000A538A6B901CC52C0C35234AF0CFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (326, 'Wissinoming Park', 'picnic table', 40.0239169400454, -75.0704257767344, '0101000020E6100000A8F71DDB81C452C05FA8D5B50F034440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (327, 'Belmont Plateau', 'picnic table', 39.9891353089363, -75.210638711024, '0101000020E6100000A9C7C91A7BCD52C0A2995DFC9BFE4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (328, 'West Fairmount Park', 'picnic table', 39.9815599744465, -75.2225722547208, '0101000020E610000076C1B29F3ECE52C0B8A7DAC1A3FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (329, 'South Philadelphia High School Park', 'picnic table', 39.9237970806088, -75.1694939847595, '0101000020E61000004A5A4CFDD8CA52C073AD94FB3EF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (330, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9041434477353, -75.1792156707245, '0101000020E6100000512C014578CB52C03975F5F8BAF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (331, 'John Dickinson Square', 'picnic table', 39.9277706361751, -75.1513331845592, '0101000020E6100000CE9E6171AFC952C0D4472E30C1F64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (332, 'Columbus Square', 'picnic table', 39.9332924041115, -75.1653664865922, '0101000020E610000026F1505D95CA52C0CEA1202076F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (333, 'Dr Nicola Capitolo Playground', 'picnic table', 39.9335066369366, -75.1592051476686, '0101000020E6100000DBA5C96A30CA52C0EE1E3E257DF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (334, 'Edward Shippen Plaza (Bainbridge Green)', 'picnic table', 39.9408248068668, -75.1506227794076, '0101000020E6100000A6E5B9CDA3C952C0146180F26CF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (335, 'Edward Shippen Plaza (Bainbridge Green)', 'picnic table', 39.9406941492056, -75.1496861748324, '0101000020E61000006264527594C952C0343077AA68F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (336, 'Sister Clara Muhammad Square', 'picnic table', 39.9715673924844, -75.21670385435, '0101000020E61000006DD6D779DECD52C04E4A00525CFC4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (337, 'Albert W Christy Sr Recreation Center', 'picnic table', 39.948698395555, -75.2350859546061, '0101000020E61000000FB2F5A50BCF52C09456F3F26EF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (338, 'Franklin Delano Roosevelt Park', 'picnic table', 39.9041771248004, -75.1786255753585, '0101000020E61000003619F7996ECB52C08E677613BCF34340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (339, 'Ford Road Playground', 'picnic table', 39.9997375016129, -75.2063515826307, '0101000020E61000001CB844DD34CD52C08E010166F7FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (340, 'Ford Road Playground', 'picnic table', 39.9994427016509, -75.206129937823, '0101000020E6100000486B9F3B31CD52C083E80ABDEDFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (341, 'Growing Homes Community Garden', 'community garden', 39.923772920048, -75.1590730127664, '0101000020E610000081E092402ECA52C0AF44E8303EF64340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (342, 'Waverly Street Community Garden', 'community garden', 39.9446458182682, -75.1609841676737, '0101000020E610000045D589904DCA52C0EEE17727EAF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (343, 'FNC Community Learning Farm at 8th and Poplar', 'community garden', 39.967940643076, -75.1510478067445, '0101000020E610000069866BC4AAC952C0853D9F7AE5FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (344, 'Sartain Community Garden', 'community garden', 39.9476025478492, -75.1603107050448, '0101000020E61000006ED7D48742CA52C02E4F500A4BF94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (345, 'South Street Community Garden', 'community garden', 39.9426199401795, -75.1563390006147, '0101000020E6100000AFAE4B7501CA52C070D02BC5A7F84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (346, 'Brewerytown Garden', 'community garden', 39.9770451442576, -75.1796809849726, '0101000020E6100000E88AACE47FCB52C0A8A6B6D00FFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (347, 'Disston Park Garden', 'community garden', 40.020969590198, -75.0452528477215, '0101000020E6100000F140336CE5C252C0330EAC21AF024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (348, 'Hunting Park Community Garden', 'community garden', 40.0178529496991, -75.1463407199525, '0101000020E6100000399177A55DC952C0218C650149024440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (349, 'Fisher Park Roots Garden', 'community garden', 40.0441595591751, -75.1317710698195, '0101000020E6100000C1DBECEF6EC852C03E3B3B05A7054440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (350, 'Capitolo Community Garden', 'community garden', 39.9343419445058, -75.1601324210542, '0101000020E610000041DD0D9C3FCA52C07C774F8498F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (351, 'Manton Street Park Community Garden', 'community garden', 39.9328692299603, -75.1512393253894, '0101000020E6100000A91AB5E7ADC952C0E60F494268F74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (352, 'South Philadelphia Older Adult Center Garden', 'community garden', 39.93163774147, -75.1628715910522, '0101000020E61000001141F77C6CCA52C09EAACFE73FF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (353, 'Schuylkill River Park Community Garden', 'community garden', 39.9493803881273, -75.1815393226148, '0101000020E610000063641B579ECB52C03B3CEB4B85F94340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (354, 'Garden Court Community Garden', 'community garden', 39.9533270864449, -75.2167660759251, '0101000020E6100000C1BED17EDFCD52C0FE55399F06FA4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (355, 'Cobbs Creek Park Community Garden', 'community garden', 39.9627515260364, -75.2499548080345, '0101000020E61000001D7F7342FFCF52C00E4027713BFB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (356, 'Poquessing Creek Park Garden', 'community garden', 40.0794852456394, -74.9704741591184, '0101000020E6100000B4C1A53F1CBE52C0934491922C0A4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (357, 'Pleasant Playground Community Garden', 'community garden', 40.0576441453188, -75.1811409805227, '0101000020E6100000DDD356D097CB52C09D7923E260074440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (358, 'The Spring Gardens', 'community garden', 39.9663813201503, -75.1679735609509, '0101000020E61000001DB82D14C0CA52C063C11262B2FB4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (359, 'Fox Chase Farm', 'urban agriculture', 40.0906963858294, -75.0745555390182, '0101000020E610000068749884C5C452C058806DF09B0B4440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (360, 'Master Gardeners Demonstration Vegetable Garden & Food Forest', 'urban agriculture', 39.9827744710243, -75.2106575496435, '0101000020E6100000F597CD697BCD52C05032CA8DCBFD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (361, 'Greenland Nursery', 'urban agriculture', 39.9955625233418, -75.2030201743978, '0101000020E6100000E05D5448FECC52C02A70BF976EFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (362, 'Saul High School - Henry Got Crops', 'urban agriculture', 40.0494021359207, -75.219289865521, '0101000020E610000072305CD808CE52C0E41027CF52064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (363, 'Sankofa Community Farm', 'urban agriculture', 39.9304961415136, -75.2134237049817, '0101000020E61000009A45E6BBA8CD52C0746D607F1AF74340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (364, 'Carousel House Farm', 'urban agriculture', 39.9795299255405, -75.2135368766178, '0101000020E61000000F649396AACD52C02BD3913C61FD4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (365, 'Strawberry Mansion Orchard & Gardens', 'urban agriculture', 39.9946835522964, -75.1901732295782, '0101000020E61000003D6756CC2BCC52C0B77D67CA51FF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (366, 'Woodford Mansion Orchard', 'urban agriculture', 39.9930465310879, -75.1879382729851, '0101000020E6100000D008402E07CC52C0E23613261CFF4340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (367, 'EarthKeepers Farm', 'urban agriculture', 39.9418826103666, -75.2179887685383, '0101000020E61000001CF12987F3CD52C00B19009C8FF84340');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (368, 'Glen Foerd on the Delaware', 'urban agriculture', 40.0523812469465, -74.9805370786794, '0101000020E6100000615C971EC1BE52C08B47BF6DB4064440');
INSERT INTO public.location (id, name, type, lat, long, loc) VALUES (369, 'Fair Amount Food Forest', 'urban agriculture', 39.9928172622511, -75.1876602004437, '0101000020E6100000A8EAED9F02CC52C0E922D4A214FF4340');


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (1, '2024-04-20 23:08:05.19192+00', 'Joe', '1988-11-13', 14, 'joker', 40.0843288686737, -75.2293143719592, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (2, '2024-04-20 23:08:30.289565+00', 'Kylie', '1900-01-01', 14, 'joker', 40.084158835356, -75.1308776884963, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (5, '2024-04-21 00:55:14.609853+00', 'Sophia Patel', NULL, NULL, NULL, NULL, NULL, 2002, 2, 2, 35, 'ISFJ', 'E', 1, 0, 1, 0, 'Gemini', 21, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (6, '2024-04-21 00:55:14.609853+00', 'Liam Nguyen', NULL, NULL, NULL, NULL, NULL, 2007, 4, 12, 42, 'ISFP', 'E', 0, 0, 0, 0, 'Cancer', 5, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (7, '2024-04-21 00:55:14.609853+00', 'Ava Rossi', NULL, NULL, NULL, NULL, NULL, 1966, 6, 23, 53, 'INFJ', 'I', 0, 1, 0, 1, 'Leo', 23, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (8, '2024-04-21 00:55:14.609853+00', 'Liam Nguyen', NULL, NULL, NULL, NULL, NULL, 1996, 5, 22, 24, 'INFP', 'E', 1, 0, 1, 1, 'Virgo', 2, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (9, '2024-04-21 00:55:14.609853+00', 'Noah Schmidt', NULL, NULL, NULL, NULL, NULL, 1978, 7, 2, 15, 'INTJ', 'E', 1, 1, 1, 1, 'Scorpio', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (10, '2024-04-21 00:55:14.609853+00', 'Isabella Gupta', NULL, NULL, NULL, NULL, NULL, 1990, 8, 5, 25, 'INTP', 'E', 1, 1, 1, 1, 'Sagittarius', 14, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (11, '2024-04-21 00:55:14.609853+00', 'Mason Lee', NULL, NULL, NULL, NULL, NULL, 1965, 10, 12, 56, 'ESTP', 'I', 0, 0, 0, 0, 'Capricorn', 18, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (12, '2024-04-21 00:55:14.609853+00', 'Mia Hernandez', NULL, NULL, NULL, NULL, NULL, 1985, 9, 10, 36, 'ESTJ', 'I', 1, 0, 1, 0, 'Aquarius', 10, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (13, '2024-04-21 00:55:14.609853+00', 'William Davis', NULL, NULL, NULL, NULL, NULL, 2001, 12, 17, 40, 'ESFP', 'E', 1, 1, 1, 1, 'Pisces', 29, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (14, '2024-04-21 00:55:14.609853+00', 'Emma Müller', NULL, NULL, NULL, NULL, NULL, 2000, 9, 16, 21, 'ESFP', 'E', 0, 0, 0, 0, 'Aries', 27, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (15, '2024-04-21 00:55:14.609853+00', 'James Wilson', NULL, NULL, NULL, NULL, NULL, 1944, 5, 10, 11, 'ESFJ', 'I', 0, 0, 0, 1, 'Taurus', 23, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (16, '2024-04-21 00:55:14.609853+00', 'Charlotte Taylor', NULL, NULL, NULL, NULL, NULL, 1946, 7, 20, 3, 'ENFP', 'E', 1, 1, 1, 0, 'Gemini', 1, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (17, '2024-04-21 00:55:14.609853+00', 'Benjamin Anderson', NULL, NULL, NULL, NULL, NULL, 1967, 2, 21, 24, 'ENFJ', 'E', 1, 0, 1, 1, 'Cancer', 3, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (18, '2024-04-21 00:55:14.609853+00', 'Amelia Moore', NULL, NULL, NULL, NULL, NULL, 1987, 4, 14, 42, 'ENTP', 'E', 1, 0, 1, 1, 'Leo', 4, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (19, '2024-04-21 00:55:14.609853+00', 'Elijah Johnson', NULL, NULL, NULL, NULL, NULL, 1976, 6, 2, 12, 'ENTJ', 'I', 1, 0, 0, 0, 'Virgo', 5, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (20, '2024-04-21 00:55:14.609853+00', 'Harper Brown', NULL, NULL, NULL, NULL, NULL, 1989, 5, 12, 11, 'ISTJ', 'I', 0, 1, 0, 0, 'Scorpio', 6, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (21, '2024-04-21 00:55:14.609853+00', 'Alexander Garcia', NULL, NULL, NULL, NULL, NULL, 1997, 7, 17, 34, 'ISTP', 'E', 0, 0, 1, 1, 'Sagittarius', 16, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (22, '2024-04-21 00:55:14.609853+00', 'Evelyn Martinez', NULL, NULL, NULL, NULL, NULL, 1986, 8, 16, 33, 'ISFJ', 'E', 1, 0, 1, 1, 'Capricorn', 14, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (23, '2024-04-21 00:55:14.609853+00', 'Daniel Gonzalez', NULL, NULL, NULL, NULL, NULL, 1976, 10, 10, 37, 'ISFP', 'I', 0, 1, 1, 1, 'Aquarius', 13, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (24, '2024-04-21 00:55:14.609853+00', 'Abigail Smith', NULL, NULL, NULL, NULL, NULL, 1995, 9, 20, 42, 'INFJ', 'E', 1, 0, 0, 0, 'Pisces', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (25, '2024-04-21 00:55:14.609853+00', 'Matthew Jones', NULL, NULL, NULL, NULL, NULL, 1984, 12, 21, 32, 'INFP', 'E', 0, 1, 1, 1, 'Aries', 11, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (26, '2024-04-21 00:55:14.609853+00', 'Emily Tran', NULL, NULL, NULL, NULL, NULL, 1979, 12, 14, 26, 'INTJ', 'E', 1, 0, 1, 1, 'Taurus', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (27, '2024-04-21 00:55:14.609853+00', 'Joseph Kim', NULL, NULL, NULL, NULL, NULL, 1995, 9, 2, 29, 'INTP', 'I', 1, 0, 0, 0, 'Gemini', 21, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (28, '2024-04-21 00:55:14.609853+00', 'Elizabeth Chen', NULL, NULL, NULL, NULL, NULL, 1981, 11, 12, 20, 'ESTP', 'I', 0, 1, 0, 0, 'Cancer', 24, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (29, '2024-04-21 00:55:14.609853+00', 'David Singh', NULL, NULL, NULL, NULL, NULL, 1972, 2, 2, 26, 'ESTJ', 'E', 0, 0, 1, 1, 'Leo', 28, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (30, '2024-04-21 00:55:14.609853+00', 'Sofia Ivanov', NULL, NULL, NULL, NULL, NULL, 1971, 4, 12, 24, 'ESFP', 'E', 1, 1, 1, 1, 'Virgo', 26, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (31, '2024-04-21 00:55:14.609853+00', 'Logan Petrov', NULL, NULL, NULL, NULL, NULL, 1976, 6, 23, 12, 'ESFP', 'I', 1, 0, 1, 0, 'Scorpio', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (32, '2024-04-21 00:55:14.609853+00', 'Ella Nakamura', NULL, NULL, NULL, NULL, NULL, 2003, 5, 22, 13, 'ESFJ', 'E', 1, 0, 1, 1, 'Sagittarius', 2, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (33, '2024-04-21 00:55:14.609853+00', 'Jackson Park', NULL, NULL, NULL, NULL, NULL, 1990, 7, 2, 14, 'ENFP', 'E', 0, 1, 0, 1, 'Capricorn', 24, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (34, '2024-04-21 00:55:14.609853+00', 'Avery Sato', NULL, NULL, NULL, NULL, NULL, 1975, 8, 5, 21, 'ISTJ', 'E', 1, 0, 0, 0, 'Aries', 4, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (35, '2024-04-21 00:55:14.609853+00', 'Aiden Yamamoto', NULL, NULL, NULL, NULL, NULL, 1974, 10, 12, 25, 'ISTP', 'I', 1, 1, 1, 0, 'Taurus', 19, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (36, '2024-04-21 00:55:14.609853+00', 'Chloe Watanabe', NULL, NULL, NULL, NULL, NULL, 1986, 9, 10, 21, 'ISFJ', 'I', 0, 0, 0, 1, 'Gemini', 17, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (45, '2024-04-21 00:55:14.609853+00', 'Nora Kato', NULL, NULL, NULL, NULL, NULL, 1977, 7, 17, 37, 'ESFP', 'E', 1, 0, 0, 0, 'Aries', 17, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (46, '2024-04-21 00:55:14.609853+00', 'Wyatt Yoshida', NULL, NULL, NULL, NULL, NULL, 1998, 8, 16, 38, 'ESFJ', 'E', 1, 1, 0, 1, 'Taurus', 3, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (47, '2024-04-21 00:55:14.609853+00', 'Hazel Matsumoto', NULL, NULL, NULL, NULL, NULL, 1976, 10, 4, 32, 'ENFP', 'I', 1, 0, 1, 1, 'Gemini', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (48, '2024-04-21 00:55:14.609853+00', 'Jayden Yamaguchi', NULL, NULL, NULL, NULL, NULL, 1996, 9, 7, 39, 'ENFJ', 'E', 0, 0, 0, 0, 'Cancer', 14, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (49, '2024-04-21 00:55:14.609853+00', 'Penelope Mori', NULL, NULL, NULL, NULL, NULL, 1990, 12, 3, 40, 'ENTP', 'E', 1, 1, 0, 0, 'Leo', 15, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (50, '2024-04-21 00:55:14.609853+00', 'Leo Kimura', NULL, NULL, NULL, NULL, NULL, 1979, 2, 7, 47, 'ENTJ', 'E', 1, 1, 0, 1, 'Virgo', 12, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (51, '2024-04-21 00:55:14.609853+00', 'Aurora Shimizu', NULL, NULL, NULL, NULL, NULL, 2000, 5, 9, 49, 'ENFP', 'I', 0, 0, 1, 1, 'Scorpio', 18, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (52, '2024-04-21 00:55:14.609853+00', 'Ezra Hayashi', NULL, NULL, NULL, NULL, NULL, 1987, 7, 6, 29, 'ENFJ', 'I', 0, 0, 0, 1, 'Sagittarius', 19, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (53, '2024-04-21 00:55:14.609853+00', 'Nova Miyamoto', NULL, NULL, NULL, NULL, NULL, 2006, 2, 3, 50, 'ENTP', 'E', 1, 1, 0, 0, 'Capricorn', 21, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (43, '2024-04-21 00:55:14.609853+00', 'Lily Ito', NULL, NULL, NULL, NULL, NULL, 1966, 6, 2, 26, 'ESTJ', 'I', 0, 0, 0, 0, 'Aquarius', 15, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (42, '2024-04-21 00:55:14.609853+00', 'Sebastian Kobayashi', NULL, NULL, NULL, NULL, NULL, 1934, 4, 14, 38, 'ESTP', 'E', 1, 0, 0, 1, 'Capricorn', 28, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (41, '2024-04-21 00:55:14.609853+00', 'Mila Suzuki', NULL, NULL, NULL, NULL, NULL, 1976, 2, 21, 46, 'INTP', 'E', 1, 1, 1, 0, 'Sagittarius', 19, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (40, '2024-04-21 00:55:14.609853+00', 'Finn Nakajima', NULL, NULL, NULL, NULL, NULL, 1980, 3, 20, 26, 'INTJ', 'E', 0, 1, 1, 0, 'Scorpio', 28, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (39, '2024-04-21 00:55:14.609853+00', 'Henry Fujita', NULL, NULL, NULL, NULL, NULL, 1969, 1, 10, 29, 'INFP', 'I', 1, 0, 0, 1, 'Virgo', 19, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (38, '2024-04-21 00:55:14.609853+00', 'Scarlett Takahashi', NULL, NULL, NULL, NULL, NULL, 1990, 1, 16, 20, 'INFJ', 'E', 1, 1, 1, 1, 'Leo', 18, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (37, '2024-04-21 00:55:14.609853+00', 'Lucas Tanaka', NULL, NULL, NULL, NULL, NULL, 1976, 12, 17, 24, 'ISFP', 'E', 0, 0, 0, 1, 'Cancer', 15, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (3, '2024-04-21 00:55:14.609853+00', 'Olivia Thompson', NULL, NULL, NULL, 40.0843288686737, -75.2293143719592, 1968, 1, 12, 24, 'ISTJ', 'I', 0, 1, 0, 1, 'Aries', 1, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (54, '2024-04-21 00:55:14.609853+00', 'Finn Nakajima', NULL, NULL, NULL, NULL, NULL, 1991, 4, 2, 59, 'ENTJ', 'E', 1, 0, 1, 1, 'Aquarius', 22, 0);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (44, '2024-04-21 00:55:14.609853+00', 'Caleb Saito', NULL, NULL, NULL, NULL, NULL, 1946, 5, 12, 31, 'ESFP', 'I', 0, 1, 1, 1, 'Pisces', 15, 1);
INSERT INTO public.person (id, created_at, name, dob, mbti, tarot, lat, lng, "Year", "Month", "Hour", "Minutes", "Personality_Type", "Introvert_Extrovert", "Minority", "Educational_Disability", "Physical_Disability", "Degree_Acquired", "Astrology_Sign", "Day", "groupNum") VALUES (4, '2024-04-21 00:55:14.609853+00', 'Ethan Rodriguez', NULL, NULL, NULL, 40.0843288686737, -75.2293143719592, 1968, 3, 1, 12, 'ISTP', 'I', 1, 1, 1, 1, 'Taurus', 23, 0);


--
-- Data for Name: broadcasts; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--



--
-- Data for Name: channels; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--



--
-- Data for Name: presences; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--



--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116024918, '2024-04-20 16:03:55');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116045059, '2024-04-20 16:03:55');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116050929, '2024-04-20 16:03:55');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116051442, '2024-04-20 16:03:55');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116212300, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116213355, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116213934, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211116214523, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211122062447, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211124070109, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211202204204, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211202204605, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211210212804, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20211228014915, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220107221237, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220228202821, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220312004840, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220603231003, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220603232444, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220615214548, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220712093339, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220908172859, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20220916233421, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230119133233, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230128025114, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230128025212, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230227211149, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230228184745, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230308225145, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20230328144023, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20231018144023, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20231204144023, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20231204144024, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20231204144025, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240108234812, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240109165339, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240227174441, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240311171622, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240321100241, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240401105812, '2024-04-20 16:03:56');
INSERT INTO realtime.schema_migrations (version, inserted_at) VALUES (20240418121054, '2024-04-20 16:03:56');


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (0, 'create-migrations-table', 'e18db593bcde2aca2a408c4d1100f6abba2195df', '2024-04-20 16:00:56.512991');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (1, 'initialmigration', '6ab16121fbaa08bbd11b712d05f358f9b555d777', '2024-04-20 16:00:56.565614');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (2, 'storage-schema', '5c7968fd083fcea04050c1b7f6253c9771b99011', '2024-04-20 16:00:56.614296');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (3, 'pathtoken-column', '2cb1b0004b817b29d5b0a971af16bafeede4b70d', '2024-04-20 16:00:56.680773');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (4, 'add-migrations-rls', '427c5b63fe1c5937495d9c635c263ee7a5905058', '2024-04-20 16:00:56.750166');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (5, 'add-size-functions', '79e081a1455b63666c1294a440f8ad4b1e6a7f84', '2024-04-20 16:00:56.801976');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (6, 'change-column-name-in-get-size', 'f93f62afdf6613ee5e7e815b30d02dc990201044', '2024-04-20 16:00:56.853177');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (7, 'add-rls-to-buckets', 'e7e7f86adbc51049f341dfe8d30256c1abca17aa', '2024-04-20 16:00:56.901666');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (8, 'add-public-to-buckets', 'fd670db39ed65f9d08b01db09d6202503ca2bab3', '2024-04-20 16:00:56.949273');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (9, 'fix-search-function', '3a0af29f42e35a4d101c259ed955b67e1bee6825', '2024-04-20 16:00:56.998377');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (10, 'search-files-search-function', '68dc14822daad0ffac3746a502234f486182ef6e', '2024-04-20 16:00:57.005657');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (11, 'add-trigger-to-auto-update-updated_at-column', '7425bdb14366d1739fa8a18c83100636d74dcaa2', '2024-04-20 16:00:57.01258');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (12, 'add-automatic-avif-detection-flag', '8e92e1266eb29518b6a4c5313ab8f29dd0d08df9', '2024-04-20 16:00:57.061259');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (13, 'add-bucket-custom-limits', 'cce962054138135cd9a8c4bcd531598684b25e7d', '2024-04-20 16:00:57.069497');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (14, 'use-bytes-for-max-size', '941c41b346f9802b411f06f30e972ad4744dad27', '2024-04-20 16:00:57.117036');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (15, 'add-can-insert-object-function', '934146bc38ead475f4ef4b555c524ee5d66799e5', '2024-04-20 16:00:57.194521');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (16, 'add-version', '76debf38d3fd07dcfc747ca49096457d95b1221b', '2024-04-20 16:00:57.246137');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (17, 'drop-owner-foreign-key', 'f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101', '2024-04-20 16:00:57.297095');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (18, 'add_owner_id_column_deprecate_owner', 'e7a511b379110b08e2f214be852c35414749fe66', '2024-04-20 16:00:57.3455');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (19, 'alter-default-value-objects-id', '02e5e22a78626187e00d173dc45f58fa66a4f043', '2024-04-20 16:00:57.3971');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (20, 'list-objects-with-delimiter', 'cd694ae708e51ba82bf012bba00caf4f3b6393b7', '2024-04-20 16:00:57.445482');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (21, 's3-multipart-uploads', '8c804d4a566c40cd1e4cc5b3725a664a9303657f', '2024-04-20 16:00:57.456912');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (22, 's3-multipart-uploads-big-ints', '9737dc258d2397953c9953d9b86920b8be0cdb73', '2024-04-20 16:00:57.5262');
INSERT INTO storage.migrations (id, name, hash, executed_at) VALUES (23, 'optimize-search-function', '9d7e604cddc4b56a5422dc68c9313f4a1b6f132c', '2024-04-20 16:00:57.593811');


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Event_id_seq"', 25, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 54, true);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_id_seq', 1, true);


--
-- Name: group_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_membership_id_seq', 3, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 369, true);


--
-- Name: broadcasts_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.broadcasts_id_seq', 1, false);


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.channels_id_seq', 1, false);


--
-- Name: presences_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.presences_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: affair Event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affair
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: person User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: group_membership group_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_membership
    ADD CONSTRAINT group_membership_pkey PRIMARY KEY (id);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: broadcasts broadcasts_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts
    ADD CONSTRAINT broadcasts_pkey PRIMARY KEY (id);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: presences presences_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences
    ADD CONSTRAINT presences_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: broadcasts_channel_id_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX broadcasts_channel_id_index ON realtime.broadcasts USING btree (channel_id);


--
-- Name: channels_name_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX channels_name_index ON realtime.channels USING btree (name);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: presences_channel_id_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX presences_channel_id_index ON realtime.presences USING btree (channel_id);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: affair public_affair_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affair
    ADD CONSTRAINT public_affair_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: group_membership public_group_membership_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_membership
    ADD CONSTRAINT public_group_membership_group_fkey FOREIGN KEY ("group") REFERENCES public."group"(id);


--
-- Name: group_membership public_group_membership_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_membership
    ADD CONSTRAINT public_group_membership_user_fkey FOREIGN KEY ("user") REFERENCES public.person(id);


--
-- Name: broadcasts broadcasts_channel_id_fkey; Type: FK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts
    ADD CONSTRAINT broadcasts_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES realtime.channels(id) ON DELETE CASCADE;


--
-- Name: presences presences_channel_id_fkey; Type: FK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences
    ADD CONSTRAINT presences_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES realtime.channels(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: broadcasts; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.broadcasts ENABLE ROW LEVEL SECURITY;

--
-- Name: channels; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.channels ENABLE ROW LEVEL SECURITY;

--
-- Name: presences; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.presences ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: DATABASE postgres; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE postgres TO dashboard_user;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION box2d_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2d_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box2d_out(extensions.box2d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2d_out(extensions.box2d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box2df_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2df_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box2df_out(extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2df_out(extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box3d_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box3d_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box3d_out(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box3d_out(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_analyze(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_analyze(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_in(cstring, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_in(cstring, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_out(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_out(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_recv(internal, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_recv(internal, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_send(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_send(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_typmod_in(cstring[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_typmod_in(cstring[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_typmod_out(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_typmod_out(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_analyze(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_analyze(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_out(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_out(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_recv(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_recv(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_send(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_send(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_typmod_in(cstring[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_typmod_in(cstring[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_typmod_out(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_typmod_out(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gidx_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gidx_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gidx_out(extensions.gidx); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gidx_out(extensions.gidx) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION spheroid_in(cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.spheroid_in(cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION spheroid_out(extensions.spheroid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.spheroid_out(extensions.spheroid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box3d(extensions.box2d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box3d(extensions.box2d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(extensions.box2d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(extensions.box2d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box2d(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2d(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bytea(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bytea(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography(extensions.geography, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography(extensions.geography, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box2d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box2d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION box3d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box3d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bytea(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bytea(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(extensions.geometry, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(extensions.geometry, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION json(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.json(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION jsonb(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.jsonb(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION path(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.path(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION point(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.point(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION polygon(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.polygon(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION text(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.text(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(path); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(path) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(point); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(point) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(polygon); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(polygon) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION _postgis_deprecate(oldname text, newname text, version text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_deprecate(oldname text, newname text, version text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_index_extent(tbl regclass, col text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_index_extent(tbl regclass, col text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_join_selectivity(regclass, text, regclass, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_join_selectivity(regclass, text, regclass, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_pgsql_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_pgsql_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_scripts_pgsql_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_scripts_pgsql_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_selectivity(tbl regclass, att_name text, geom extensions.geometry, mode text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_selectivity(tbl regclass, att_name text, geom extensions.geometry, mode text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _postgis_stats(tbl regclass, att_name text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._postgis_stats(tbl regclass, att_name text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_3ddfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_3ddfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_3ddwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_3ddwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_3dintersects(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_3dintersects(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_asgml(integer, extensions.geometry, integer, integer, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_asgml(integer, extensions.geometry, integer, integer, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_asx3d(integer, extensions.geometry, integer, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_asx3d(integer, extensions.geometry, integer, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_bestsrid(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_bestsrid(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_bestsrid(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_bestsrid(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_concavehull(param_inputgeom extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_concavehull(param_inputgeom extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_contains(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_contains(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_containsproperly(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_containsproperly(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_coveredby(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_coveredby(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_coveredby(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_coveredby(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_covers(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_covers(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_covers(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_covers(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_crosses(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_crosses(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_dfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_dfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_distancetree(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_distancetree(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_distancetree(extensions.geography, extensions.geography, double precision, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_distancetree(extensions.geography, extensions.geography, double precision, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_distanceuncached(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_distanceuncached(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_distanceuncached(extensions.geography, extensions.geography, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_distanceuncached(extensions.geography, extensions.geography, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_distanceuncached(extensions.geography, extensions.geography, double precision, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_distanceuncached(extensions.geography, extensions.geography, double precision, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_dwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_dwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_dwithin(geog1 extensions.geography, geog2 extensions.geography, tolerance double precision, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_dwithin(geog1 extensions.geography, geog2 extensions.geography, tolerance double precision, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_dwithinuncached(extensions.geography, extensions.geography, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_dwithinuncached(extensions.geography, extensions.geography, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_dwithinuncached(extensions.geography, extensions.geography, double precision, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_dwithinuncached(extensions.geography, extensions.geography, double precision, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_equals(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_equals(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_expand(extensions.geography, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_expand(extensions.geography, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_geomfromgml(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_geomfromgml(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_intersects(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_intersects(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_linecrossingdirection(line1 extensions.geometry, line2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_linecrossingdirection(line1 extensions.geometry, line2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_longestline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_longestline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_maxdistance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_maxdistance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_orderingequals(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_orderingequals(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_overlaps(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_overlaps(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_pointoutside(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_pointoutside(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_sortablehash(geom extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_sortablehash(geom extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_touches(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_touches(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_voronoi(g1 extensions.geometry, clip extensions.geometry, tolerance double precision, return_polygons boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_voronoi(g1 extensions.geometry, clip extensions.geometry, tolerance double precision, return_polygons boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _st_within(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._st_within(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION addauth(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.addauth(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION box3dtobox(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.box3dtobox(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION checkauth(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.checkauth(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION checkauth(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.checkauth(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION checkauthtrigger(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.checkauthtrigger() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION contains_2d(extensions.box2df, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.contains_2d(extensions.box2df, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION contains_2d(extensions.box2df, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.contains_2d(extensions.box2df, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION contains_2d(extensions.geometry, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.contains_2d(extensions.geometry, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION disablelongtransactions(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.disablelongtransactions() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrycolumn(table_name character varying, column_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrycolumn(table_name character varying, column_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrytable(table_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrytable(table_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrytable(schema_name character varying, table_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrytable(schema_name character varying, table_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enablelongtransactions(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enablelongtransactions() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION equals(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.equals(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION find_srid(character varying, character varying, character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.find_srid(character varying, character varying, character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION geog_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geog_brin_inclusion_add_value(internal, internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_cmp(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_cmp(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_distance_knn(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_distance_knn(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_eq(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_eq(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_ge(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_ge(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_compress(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_compress(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_consistent(internal, extensions.geography, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_consistent(internal, extensions.geography, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_decompress(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_decompress(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_distance(internal, extensions.geography, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_distance(internal, extensions.geography, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_penalty(internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_penalty(internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_picksplit(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_picksplit(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_same(extensions.box2d, extensions.box2d, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_same(extensions.box2d, extensions.box2d, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gist_union(bytea, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gist_union(bytea, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_gt(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_gt(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_le(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_le(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_lt(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_lt(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_overlaps(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_overlaps(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_choose_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_choose_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_compress_nd(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_compress_nd(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_config_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_config_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_inner_consistent_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_inner_consistent_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_leaf_consistent_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_leaf_consistent_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geography_spgist_picksplit_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geography_spgist_picksplit_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geom2d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geom2d_brin_inclusion_add_value(internal, internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geom3d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geom3d_brin_inclusion_add_value(internal, internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geom4d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geom4d_brin_inclusion_add_value(internal, internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_above(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_above(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_below(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_below(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_cmp(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_cmp(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_contained_3d(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_contained_3d(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_contains(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_contains(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_contains_3d(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_contains_3d(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_contains_nd(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_contains_nd(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_distance_box(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_distance_box(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_distance_centroid(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_distance_centroid(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_distance_centroid_nd(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_distance_centroid_nd(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_distance_cpa(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_distance_cpa(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_eq(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_eq(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_ge(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_ge(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_compress_2d(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_compress_2d(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_compress_nd(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_compress_nd(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_consistent_2d(internal, extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_consistent_2d(internal, extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_consistent_nd(internal, extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_consistent_nd(internal, extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_decompress_2d(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_decompress_2d(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_decompress_nd(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_decompress_nd(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_distance_2d(internal, extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_distance_2d(internal, extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_distance_nd(internal, extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_distance_nd(internal, extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_penalty_2d(internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_penalty_2d(internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_penalty_nd(internal, internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_penalty_nd(internal, internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_picksplit_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_picksplit_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_picksplit_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_picksplit_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_same_2d(geom1 extensions.geometry, geom2 extensions.geometry, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_same_2d(geom1 extensions.geometry, geom2 extensions.geometry, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_same_nd(extensions.geometry, extensions.geometry, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_same_nd(extensions.geometry, extensions.geometry, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_sortsupport_2d(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_sortsupport_2d(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_union_2d(bytea, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_union_2d(bytea, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gist_union_nd(bytea, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gist_union_nd(bytea, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_gt(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_gt(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_hash(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_hash(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_le(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_le(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_left(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_left(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_lt(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_lt(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overabove(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overabove(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overbelow(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overbelow(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overlaps(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overlaps(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overlaps_3d(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overlaps_3d(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overlaps_nd(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overlaps_nd(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overleft(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overleft(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_overright(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_overright(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_right(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_right(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_same(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_same(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_same_3d(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_same_3d(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_same_nd(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_same_nd(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_sortsupport(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_sortsupport(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_choose_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_choose_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_choose_3d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_choose_3d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_choose_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_choose_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_compress_2d(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_compress_2d(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_compress_3d(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_compress_3d(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_compress_nd(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_compress_nd(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_config_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_config_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_config_3d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_config_3d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_config_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_config_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_inner_consistent_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_inner_consistent_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_inner_consistent_3d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_inner_consistent_3d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_inner_consistent_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_inner_consistent_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_leaf_consistent_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_leaf_consistent_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_leaf_consistent_3d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_leaf_consistent_3d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_leaf_consistent_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_leaf_consistent_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_picksplit_2d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_picksplit_2d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_picksplit_3d(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_picksplit_3d(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_spgist_picksplit_nd(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_spgist_picksplit_nd(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_within(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_within(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometry_within_nd(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometry_within_nd(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometrytype(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometrytype(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geometrytype(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geometrytype(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geomfromewkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geomfromewkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION geomfromewkt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.geomfromewkt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_proj4_from_srid(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.get_proj4_from_srid(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gettransactionid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gettransactionid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION gserialized_gist_joinsel_2d(internal, oid, internal, smallint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gserialized_gist_joinsel_2d(internal, oid, internal, smallint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gserialized_gist_joinsel_nd(internal, oid, internal, smallint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gserialized_gist_joinsel_nd(internal, oid, internal, smallint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gserialized_gist_sel_2d(internal, oid, internal, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gserialized_gist_sel_2d(internal, oid, internal, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gserialized_gist_sel_nd(internal, oid, internal, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gserialized_gist_sel_nd(internal, oid, internal, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION is_contained_2d(extensions.box2df, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_contained_2d(extensions.box2df, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_contained_2d(extensions.box2df, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_contained_2d(extensions.box2df, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_contained_2d(extensions.geometry, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_contained_2d(extensions.geometry, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lockrow(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lockrow(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lockrow(text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lockrow(text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lockrow(text, text, text, timestamp without time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lockrow(text, text, text, timestamp without time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lockrow(text, text, text, text, timestamp without time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lockrow(text, text, text, text, timestamp without time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION longtransactionsenabled(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.longtransactionsenabled() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_2d(extensions.box2df, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_2d(extensions.box2df, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_2d(extensions.box2df, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_2d(extensions.box2df, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_2d(extensions.geometry, extensions.box2df); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_2d(extensions.geometry, extensions.box2df) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_geog(extensions.geography, extensions.gidx); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_geog(extensions.geography, extensions.gidx) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_geog(extensions.gidx, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_geog(extensions.gidx, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_geog(extensions.gidx, extensions.gidx); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_geog(extensions.gidx, extensions.gidx) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_nd(extensions.geometry, extensions.gidx); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_nd(extensions.geometry, extensions.gidx) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_nd(extensions.gidx, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_nd(extensions.gidx, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION overlaps_nd(extensions.gidx, extensions.gidx); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.overlaps_nd(extensions.gidx, extensions.gidx) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgis_asflatgeobuf_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asflatgeobuf_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asflatgeobuf_transfn(internal, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asflatgeobuf_transfn(internal, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asflatgeobuf_transfn(internal, anyelement, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asflatgeobuf_transfn(internal, anyelement, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asflatgeobuf_transfn(internal, anyelement, boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asflatgeobuf_transfn(internal, anyelement, boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asgeobuf_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asgeobuf_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asgeobuf_transfn(internal, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asgeobuf_transfn(internal, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asgeobuf_transfn(internal, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asgeobuf_transfn(internal, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_combinefn(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_combinefn(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_deserialfn(bytea, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_deserialfn(bytea, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_serialfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_serialfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_transfn(internal, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_transfn(internal, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_transfn(internal, anyelement, text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_transfn(internal, anyelement, text, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_asmvt_transfn(internal, anyelement, text, integer, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_accum_transfn(internal, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_accum_transfn(internal, extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, extensions.geometry, double precision, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_accum_transfn(internal, extensions.geometry, double precision, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_clusterintersecting_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_clusterintersecting_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_clusterwithin_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_clusterwithin_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_collect_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_collect_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_makeline_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_makeline_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_polygonize_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_polygonize_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_combinefn(internal, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_combinefn(internal, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_deserialfn(bytea, internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_deserialfn(bytea, internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_finalfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_finalfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_serialfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_serialfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_transfn(internal, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_transfn(internal, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgis_geometry_union_parallel_transfn(internal, extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgis_geometry_union_parallel_transfn(internal, extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION populate_geometry_columns(use_typmod boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.populate_geometry_columns(use_typmod boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION populate_geometry_columns(tbl_oid oid, use_typmod boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.populate_geometry_columns(tbl_oid oid, use_typmod boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_addbbox(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_addbbox(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_cache_bbox(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_cache_bbox() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_constraint_type(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_dropbbox(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_dropbbox(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_extensions_upgrade(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_extensions_upgrade() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_full_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_full_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_geos_noop(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_geos_noop(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_geos_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_geos_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_getbbox(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_getbbox(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_hasbbox(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_hasbbox(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_index_supportfn(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_index_supportfn(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_lib_build_date(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_lib_build_date() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_lib_revision(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_lib_revision() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_lib_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_lib_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_libjson_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_libjson_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_liblwgeom_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_liblwgeom_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_libprotobuf_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_libprotobuf_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_libxml_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_libxml_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_noop(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_noop(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_proj_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_proj_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_scripts_build_date(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_scripts_build_date() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_scripts_installed(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_scripts_installed() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_scripts_released(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_scripts_released() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_svn_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_svn_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_transform_geometry(geom extensions.geometry, text, text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_transform_geometry(geom extensions.geometry, text, text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_typmod_dims(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_typmod_dims(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_typmod_srid(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_typmod_srid(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_typmod_type(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_typmod_type(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION postgis_wagyu_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.postgis_wagyu_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION st_3dclosestpoint(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dclosestpoint(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3ddfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3ddfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3ddistance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3ddistance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3ddwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3ddwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dintersects(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dintersects(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dlength(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dlength(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dlineinterpolatepoint(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dlineinterpolatepoint(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dlongestline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dlongestline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dmakebox(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dmakebox(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dmaxdistance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dmaxdistance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dperimeter(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dperimeter(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_3dshortestline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dshortestline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_addmeasure(extensions.geometry, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_addmeasure(extensions.geometry, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_addpoint(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_addpoint(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_addpoint(geom1 extensions.geometry, geom2 extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_addpoint(geom1 extensions.geometry, geom2 extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_affine(extensions.geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_affine(extensions.geometry, double precision, double precision, double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_affine(extensions.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_affine(extensions.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_angle(line1 extensions.geometry, line2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_angle(line1 extensions.geometry, line2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_angle(pt1 extensions.geometry, pt2 extensions.geometry, pt3 extensions.geometry, pt4 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_angle(pt1 extensions.geometry, pt2 extensions.geometry, pt3 extensions.geometry, pt4 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_area(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_area(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_area(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_area(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_area(geog extensions.geography, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_area(geog extensions.geography, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_area2d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_area2d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asbinary(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asbinary(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asbinary(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asbinary(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asbinary(extensions.geography, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asbinary(extensions.geography, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asbinary(extensions.geometry, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asbinary(extensions.geometry, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asencodedpolyline(geom extensions.geometry, nprecision integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asencodedpolyline(geom extensions.geometry, nprecision integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkb(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkb(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkb(extensions.geometry, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkb(extensions.geometry, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkt(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkt(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkt(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkt(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkt(extensions.geography, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkt(extensions.geography, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asewkt(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asewkt(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeojson(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeojson(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeojson(geog extensions.geography, maxdecimaldigits integer, options integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeojson(geog extensions.geography, maxdecimaldigits integer, options integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeojson(geom extensions.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeojson(geom extensions.geometry, maxdecimaldigits integer, options integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeojson(r record, geom_column text, maxdecimaldigits integer, pretty_bool boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeojson(r record, geom_column text, maxdecimaldigits integer, pretty_bool boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgml(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgml(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgml(geom extensions.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgml(geom extensions.geometry, maxdecimaldigits integer, options integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgml(geog extensions.geography, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgml(geog extensions.geography, maxdecimaldigits integer, options integer, nprefix text, id text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgml(version integer, geog extensions.geography, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgml(version integer, geog extensions.geography, maxdecimaldigits integer, options integer, nprefix text, id text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgml(version integer, geom extensions.geometry, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgml(version integer, geom extensions.geometry, maxdecimaldigits integer, options integer, nprefix text, id text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ashexewkb(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ashexewkb(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ashexewkb(extensions.geometry, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ashexewkb(extensions.geometry, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_askml(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_askml(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_askml(geog extensions.geography, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_askml(geog extensions.geography, maxdecimaldigits integer, nprefix text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_askml(geom extensions.geometry, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_askml(geom extensions.geometry, maxdecimaldigits integer, nprefix text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_aslatlontext(geom extensions.geometry, tmpl text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_aslatlontext(geom extensions.geometry, tmpl text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmarc21(geom extensions.geometry, format text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmarc21(geom extensions.geometry, format text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvtgeom(geom extensions.geometry, bounds extensions.box2d, extent integer, buffer integer, clip_geom boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvtgeom(geom extensions.geometry, bounds extensions.box2d, extent integer, buffer integer, clip_geom boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_assvg(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_assvg(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_assvg(geog extensions.geography, rel integer, maxdecimaldigits integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_assvg(geog extensions.geography, rel integer, maxdecimaldigits integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_assvg(geom extensions.geometry, rel integer, maxdecimaldigits integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_assvg(geom extensions.geometry, rel integer, maxdecimaldigits integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astext(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astext(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astext(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astext(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astext(extensions.geography, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astext(extensions.geography, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astext(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astext(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astwkb(geom extensions.geometry, prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astwkb(geom extensions.geometry, prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_astwkb(geom extensions.geometry[], ids bigint[], prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_astwkb(geom extensions.geometry[], ids bigint[], prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asx3d(geom extensions.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asx3d(geom extensions.geometry, maxdecimaldigits integer, options integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_azimuth(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_azimuth(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_azimuth(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_azimuth(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_bdmpolyfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_bdmpolyfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_bdpolyfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_bdpolyfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_boundary(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_boundary(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_boundingdiagonal(geom extensions.geometry, fits boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_boundingdiagonal(geom extensions.geometry, fits boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_box2dfromgeohash(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_box2dfromgeohash(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(extensions.geography, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(extensions.geography, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(text, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(text, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(extensions.geography, double precision, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(extensions.geography, double precision, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(extensions.geography, double precision, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(extensions.geography, double precision, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(geom extensions.geometry, radius double precision, quadsegs integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(geom extensions.geometry, radius double precision, quadsegs integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(geom extensions.geometry, radius double precision, options text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(geom extensions.geometry, radius double precision, options text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(text, double precision, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(text, double precision, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buffer(text, double precision, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buffer(text, double precision, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_buildarea(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_buildarea(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_centroid(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_centroid(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_centroid(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_centroid(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_centroid(extensions.geography, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_centroid(extensions.geography, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_chaikinsmoothing(extensions.geometry, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_chaikinsmoothing(extensions.geometry, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_cleangeometry(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_cleangeometry(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clipbybox2d(geom extensions.geometry, box extensions.box2d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clipbybox2d(geom extensions.geometry, box extensions.box2d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_closestpoint(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_closestpoint(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_closestpointofapproach(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_closestpointofapproach(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterdbscan(extensions.geometry, eps double precision, minpoints integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterdbscan(extensions.geometry, eps double precision, minpoints integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterintersecting(extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterintersecting(extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterkmeans(geom extensions.geometry, k integer, max_radius double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterkmeans(geom extensions.geometry, k integer, max_radius double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterwithin(extensions.geometry[], double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterwithin(extensions.geometry[], double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collect(extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collect(extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collect(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collect(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collectionextract(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collectionextract(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collectionextract(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collectionextract(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collectionhomogenize(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collectionhomogenize(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_combinebbox(extensions.box2d, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_combinebbox(extensions.box2d, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_combinebbox(extensions.box3d, extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_combinebbox(extensions.box3d, extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_combinebbox(extensions.box3d, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_combinebbox(extensions.box3d, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_concavehull(param_geom extensions.geometry, param_pctconvex double precision, param_allow_holes boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_concavehull(param_geom extensions.geometry, param_pctconvex double precision, param_allow_holes boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_contains(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_contains(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_containsproperly(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_containsproperly(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_convexhull(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_convexhull(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_coorddim(geometry extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_coorddim(geometry extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_coveredby(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_coveredby(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_coveredby(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_coveredby(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_coveredby(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_coveredby(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_covers(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_covers(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_covers(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_covers(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_covers(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_covers(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_cpawithin(extensions.geometry, extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_cpawithin(extensions.geometry, extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_crosses(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_crosses(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_curvetoline(geom extensions.geometry, tol double precision, toltype integer, flags integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_curvetoline(geom extensions.geometry, tol double precision, toltype integer, flags integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_delaunaytriangles(g1 extensions.geometry, tolerance double precision, flags integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_delaunaytriangles(g1 extensions.geometry, tolerance double precision, flags integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dfullywithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_difference(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_difference(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dimension(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dimension(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_disjoint(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_disjoint(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distance(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distance(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distance(geog1 extensions.geography, geog2 extensions.geography, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distance(geog1 extensions.geography, geog2 extensions.geography, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distancecpa(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distancecpa(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distancesphere(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distancesphere(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distancesphere(geom1 extensions.geometry, geom2 extensions.geometry, radius double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distancesphere(geom1 extensions.geometry, geom2 extensions.geometry, radius double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distancespheroid(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distancespheroid(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_distancespheroid(geom1 extensions.geometry, geom2 extensions.geometry, extensions.spheroid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_distancespheroid(geom1 extensions.geometry, geom2 extensions.geometry, extensions.spheroid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dump(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dump(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dumppoints(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dumppoints(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dumprings(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dumprings(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dumpsegments(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dumpsegments(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dwithin(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dwithin(text, text, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dwithin(text, text, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_dwithin(geog1 extensions.geography, geog2 extensions.geography, tolerance double precision, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_dwithin(geog1 extensions.geography, geog2 extensions.geography, tolerance double precision, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_endpoint(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_endpoint(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_envelope(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_envelope(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_equals(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_equals(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_estimatedextent(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_estimatedextent(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_estimatedextent(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_estimatedextent(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_estimatedextent(text, text, text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_estimatedextent(text, text, text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(extensions.box2d, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(extensions.box2d, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(extensions.box3d, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(extensions.box3d, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(box extensions.box2d, dx double precision, dy double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(box extensions.box2d, dx double precision, dy double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(box extensions.box3d, dx double precision, dy double precision, dz double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(box extensions.box3d, dx double precision, dy double precision, dz double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_expand(geom extensions.geometry, dx double precision, dy double precision, dz double precision, dm double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_expand(geom extensions.geometry, dx double precision, dy double precision, dz double precision, dm double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_exteriorring(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_exteriorring(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_filterbym(extensions.geometry, double precision, double precision, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_filterbym(extensions.geometry, double precision, double precision, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_findextent(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_findextent(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_findextent(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_findextent(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_flipcoordinates(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_flipcoordinates(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_force2d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_force2d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_force3d(geom extensions.geometry, zvalue double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_force3d(geom extensions.geometry, zvalue double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_force3dm(geom extensions.geometry, mvalue double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_force3dm(geom extensions.geometry, mvalue double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_force3dz(geom extensions.geometry, zvalue double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_force3dz(geom extensions.geometry, zvalue double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_force4d(geom extensions.geometry, zvalue double precision, mvalue double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_force4d(geom extensions.geometry, zvalue double precision, mvalue double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcecollection(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcecollection(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcecurve(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcecurve(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcepolygonccw(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcepolygonccw(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcepolygoncw(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcepolygoncw(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcerhr(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcerhr(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcesfs(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcesfs(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_forcesfs(extensions.geometry, version text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_forcesfs(extensions.geometry, version text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_frechetdistance(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_frechetdistance(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_fromflatgeobuf(anyelement, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_fromflatgeobuf(anyelement, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_fromflatgeobuftotable(text, text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_fromflatgeobuftotable(text, text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_generatepoints(area extensions.geometry, npoints integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_generatepoints(area extensions.geometry, npoints integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_generatepoints(area extensions.geometry, npoints integer, seed integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_generatepoints(area extensions.geometry, npoints integer, seed integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geogfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geogfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geogfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geogfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geographyfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geographyfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geohash(geog extensions.geography, maxchars integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geohash(geog extensions.geography, maxchars integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geohash(geom extensions.geometry, maxchars integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geohash(geom extensions.geometry, maxchars integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomcollfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomcollfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomcollfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomcollfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomcollfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomcollfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomcollfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomcollfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geometricmedian(g extensions.geometry, tolerance double precision, max_iter integer, fail_if_not_converged boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geometricmedian(g extensions.geometry, tolerance double precision, max_iter integer, fail_if_not_converged boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geometryfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geometryfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geometryfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geometryfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geometryn(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geometryn(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geometrytype(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geometrytype(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromewkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromewkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromewkt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromewkt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgeohash(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgeohash(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgeojson(json); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgeojson(json) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgeojson(jsonb); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgeojson(jsonb) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgeojson(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgeojson(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgml(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgml(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromgml(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromgml(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromkml(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromkml(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfrommarc21(marc21xml text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfrommarc21(marc21xml text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromtwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromtwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_geomfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_geomfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_gmltosql(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_gmltosql(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_gmltosql(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_gmltosql(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_hasarc(geometry extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_hasarc(geometry extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_hausdorffdistance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_hausdorffdistance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_hausdorffdistance(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_hausdorffdistance(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_hexagon(size double precision, cell_i integer, cell_j integer, origin extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_hexagon(size double precision, cell_i integer, cell_j integer, origin extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_hexagongrid(size double precision, bounds extensions.geometry, OUT geom extensions.geometry, OUT i integer, OUT j integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_hexagongrid(size double precision, bounds extensions.geometry, OUT geom extensions.geometry, OUT i integer, OUT j integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_interiorringn(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_interiorringn(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_interpolatepoint(line extensions.geometry, point extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_interpolatepoint(line extensions.geometry, point extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersection(extensions.geography, extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersection(extensions.geography, extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersection(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersection(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersection(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersection(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersects(geog1 extensions.geography, geog2 extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersects(geog1 extensions.geography, geog2 extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersects(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersects(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_intersects(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_intersects(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isclosed(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isclosed(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_iscollection(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_iscollection(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isempty(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isempty(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ispolygonccw(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ispolygonccw(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ispolygoncw(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ispolygoncw(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isring(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isring(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_issimple(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_issimple(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvalid(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvalid(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvalid(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvalid(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvaliddetail(geom extensions.geometry, flags integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvaliddetail(geom extensions.geometry, flags integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvalidreason(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvalidreason(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvalidreason(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvalidreason(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_isvalidtrajectory(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_isvalidtrajectory(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_length(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_length(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_length(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_length(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_length(geog extensions.geography, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_length(geog extensions.geography, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_length2d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_length2d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_length2dspheroid(extensions.geometry, extensions.spheroid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_length2dspheroid(extensions.geometry, extensions.spheroid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_lengthspheroid(extensions.geometry, extensions.spheroid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_lengthspheroid(extensions.geometry, extensions.spheroid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_letters(letters text, font json); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_letters(letters text, font json) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linecrossingdirection(line1 extensions.geometry, line2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linecrossingdirection(line1 extensions.geometry, line2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefromencodedpolyline(txtin text, nprecision integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefromencodedpolyline(txtin text, nprecision integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefrommultipoint(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefrommultipoint(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linefromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linefromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_lineinterpolatepoint(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_lineinterpolatepoint(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_lineinterpolatepoints(extensions.geometry, double precision, repeat boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_lineinterpolatepoints(extensions.geometry, double precision, repeat boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linelocatepoint(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linelocatepoint(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linemerge(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linemerge(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linemerge(extensions.geometry, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linemerge(extensions.geometry, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linestringfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linestringfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linestringfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linestringfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linesubstring(extensions.geometry, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linesubstring(extensions.geometry, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_linetocurve(geometry extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_linetocurve(geometry extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_locatealong(geometry extensions.geometry, measure double precision, leftrightoffset double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_locatealong(geometry extensions.geometry, measure double precision, leftrightoffset double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_locatebetween(geometry extensions.geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_locatebetween(geometry extensions.geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_locatebetweenelevations(geometry extensions.geometry, fromelevation double precision, toelevation double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_locatebetweenelevations(geometry extensions.geometry, fromelevation double precision, toelevation double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_longestline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_longestline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_m(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_m(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makebox2d(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makebox2d(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makeenvelope(double precision, double precision, double precision, double precision, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makeline(extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makeline(extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makeline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makeline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepoint(double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepoint(double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepoint(double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepoint(double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepointm(double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepointm(double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepolygon(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepolygon(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makepolygon(extensions.geometry, extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makepolygon(extensions.geometry, extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makevalid(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makevalid(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makevalid(geom extensions.geometry, params text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makevalid(geom extensions.geometry, params text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_maxdistance(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_maxdistance(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_maximuminscribedcircle(extensions.geometry, OUT center extensions.geometry, OUT nearest extensions.geometry, OUT radius double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_maximuminscribedcircle(extensions.geometry, OUT center extensions.geometry, OUT nearest extensions.geometry, OUT radius double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_memsize(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_memsize(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_minimumboundingcircle(inputgeom extensions.geometry, segs_per_quarter integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_minimumboundingcircle(inputgeom extensions.geometry, segs_per_quarter integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_minimumboundingradius(extensions.geometry, OUT center extensions.geometry, OUT radius double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_minimumboundingradius(extensions.geometry, OUT center extensions.geometry, OUT radius double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_minimumclearance(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_minimumclearance(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_minimumclearanceline(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_minimumclearanceline(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mlinefromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mlinefromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mlinefromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mlinefromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mlinefromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mlinefromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mlinefromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mlinefromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpointfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpointfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpointfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpointfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpointfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpointfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpointfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpointfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpolyfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpolyfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpolyfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpolyfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpolyfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpolyfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_mpolyfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_mpolyfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multi(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multi(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multilinefromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multilinefromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multilinestringfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multilinestringfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multilinestringfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multilinestringfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipointfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipointfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipointfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipointfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipointfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipointfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipolyfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipolyfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipolyfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipolyfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipolygonfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipolygonfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_multipolygonfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_multipolygonfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ndims(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ndims(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_node(g extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_node(g extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_normalize(geom extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_normalize(geom extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_npoints(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_npoints(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_nrings(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_nrings(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_numgeometries(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_numgeometries(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_numinteriorring(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_numinteriorring(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_numinteriorrings(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_numinteriorrings(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_numpatches(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_numpatches(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_numpoints(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_numpoints(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_offsetcurve(line extensions.geometry, distance double precision, params text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_offsetcurve(line extensions.geometry, distance double precision, params text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_orderingequals(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_orderingequals(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_orientedenvelope(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_orientedenvelope(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_overlaps(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_overlaps(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_patchn(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_patchn(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_perimeter(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_perimeter(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_perimeter(geog extensions.geography, use_spheroid boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_perimeter(geog extensions.geography, use_spheroid boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_perimeter2d(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_perimeter2d(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_point(double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_point(double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_point(double precision, double precision, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_point(double precision, double precision, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointfromgeohash(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointfromgeohash(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointinsidecircle(extensions.geometry, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointinsidecircle(extensions.geometry, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointm(xcoordinate double precision, ycoordinate double precision, mcoordinate double precision, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointm(xcoordinate double precision, ycoordinate double precision, mcoordinate double precision, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointn(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointn(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointonsurface(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointonsurface(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_points(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_points(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointz(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointz(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_pointzm(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, mcoordinate double precision, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_pointzm(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, mcoordinate double precision, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polyfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polyfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polyfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polyfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polyfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polyfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polyfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polyfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygon(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygon(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonfromtext(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonfromtext(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonfromtext(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonfromtext(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonfromwkb(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonfromwkb(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonfromwkb(bytea, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonfromwkb(bytea, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonize(extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonize(extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_project(geog extensions.geography, distance double precision, azimuth double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_project(geog extensions.geography, distance double precision, azimuth double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_quantizecoordinates(g extensions.geometry, prec_x integer, prec_y integer, prec_z integer, prec_m integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_quantizecoordinates(g extensions.geometry, prec_x integer, prec_y integer, prec_z integer, prec_m integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_reduceprecision(geom extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_reduceprecision(geom extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_relate(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_relate(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_relate(geom1 extensions.geometry, geom2 extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_relate(geom1 extensions.geometry, geom2 extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_relate(geom1 extensions.geometry, geom2 extensions.geometry, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_relate(geom1 extensions.geometry, geom2 extensions.geometry, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_relatematch(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_relatematch(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_removepoint(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_removepoint(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_removerepeatedpoints(geom extensions.geometry, tolerance double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_removerepeatedpoints(geom extensions.geometry, tolerance double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_reverse(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_reverse(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotate(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotate(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotate(extensions.geometry, double precision, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotate(extensions.geometry, double precision, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotate(extensions.geometry, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotate(extensions.geometry, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotatex(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotatex(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotatey(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotatey(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_rotatez(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_rotatez(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_scale(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_scale(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_scale(extensions.geometry, extensions.geometry, origin extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_scale(extensions.geometry, extensions.geometry, origin extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_scale(extensions.geometry, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_scale(extensions.geometry, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_scale(extensions.geometry, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_scale(extensions.geometry, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_scroll(extensions.geometry, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_scroll(extensions.geometry, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_segmentize(geog extensions.geography, max_segment_length double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_segmentize(geog extensions.geography, max_segment_length double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_segmentize(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_segmentize(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_seteffectivearea(extensions.geometry, double precision, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_seteffectivearea(extensions.geometry, double precision, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_setpoint(extensions.geometry, integer, extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_setpoint(extensions.geometry, integer, extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_setsrid(geog extensions.geography, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_setsrid(geog extensions.geography, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_setsrid(geom extensions.geometry, srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_setsrid(geom extensions.geometry, srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_sharedpaths(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_sharedpaths(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_shiftlongitude(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_shiftlongitude(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_shortestline(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_shortestline(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_simplify(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_simplify(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_simplify(extensions.geometry, double precision, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_simplify(extensions.geometry, double precision, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_simplifypolygonhull(geom extensions.geometry, vertex_fraction double precision, is_outer boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_simplifypolygonhull(geom extensions.geometry, vertex_fraction double precision, is_outer boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_simplifypreservetopology(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_simplifypreservetopology(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_simplifyvw(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_simplifyvw(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_snap(geom1 extensions.geometry, geom2 extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_snap(geom1 extensions.geometry, geom2 extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_snaptogrid(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_snaptogrid(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_snaptogrid(extensions.geometry, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_snaptogrid(extensions.geometry, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_snaptogrid(extensions.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_snaptogrid(extensions.geometry, double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_snaptogrid(geom1 extensions.geometry, geom2 extensions.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_snaptogrid(geom1 extensions.geometry, geom2 extensions.geometry, double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_split(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_split(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_square(size double precision, cell_i integer, cell_j integer, origin extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_square(size double precision, cell_i integer, cell_j integer, origin extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_squaregrid(size double precision, bounds extensions.geometry, OUT geom extensions.geometry, OUT i integer, OUT j integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_squaregrid(size double precision, bounds extensions.geometry, OUT geom extensions.geometry, OUT i integer, OUT j integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_srid(geog extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_srid(geog extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_srid(geom extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_srid(geom extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_startpoint(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_startpoint(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_subdivide(geom extensions.geometry, maxvertices integer, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_subdivide(geom extensions.geometry, maxvertices integer, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_summary(extensions.geography); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_summary(extensions.geography) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_summary(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_summary(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_swapordinates(geom extensions.geometry, ords cstring); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_swapordinates(geom extensions.geometry, ords cstring) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_symdifference(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_symdifference(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_symmetricdifference(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_symmetricdifference(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_tileenvelope(zoom integer, x integer, y integer, bounds extensions.geometry, margin double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_tileenvelope(zoom integer, x integer, y integer, bounds extensions.geometry, margin double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_touches(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_touches(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_transform(extensions.geometry, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_transform(extensions.geometry, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_transform(geom extensions.geometry, to_proj text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_transform(geom extensions.geometry, to_proj text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_transform(geom extensions.geometry, from_proj text, to_srid integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_transform(geom extensions.geometry, from_proj text, to_srid integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_transform(geom extensions.geometry, from_proj text, to_proj text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_transform(geom extensions.geometry, from_proj text, to_proj text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_translate(extensions.geometry, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_translate(extensions.geometry, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_translate(extensions.geometry, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_translate(extensions.geometry, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_transscale(extensions.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_transscale(extensions.geometry, double precision, double precision, double precision, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_triangulatepolygon(g1 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_triangulatepolygon(g1 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_unaryunion(extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_unaryunion(extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_union(extensions.geometry[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_union(extensions.geometry[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_union(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_union(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_union(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_union(geom1 extensions.geometry, geom2 extensions.geometry, gridsize double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_voronoilines(g1 extensions.geometry, tolerance double precision, extend_to extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_voronoilines(g1 extensions.geometry, tolerance double precision, extend_to extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_voronoipolygons(g1 extensions.geometry, tolerance double precision, extend_to extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_voronoipolygons(g1 extensions.geometry, tolerance double precision, extend_to extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_within(geom1 extensions.geometry, geom2 extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_within(geom1 extensions.geometry, geom2 extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_wkbtosql(wkb bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_wkbtosql(wkb bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_wkttosql(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_wkttosql(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_wrapx(geom extensions.geometry, wrap double precision, move double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_wrapx(geom extensions.geometry, wrap double precision, move double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_x(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_x(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_xmax(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_xmax(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_xmin(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_xmin(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_y(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_y(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ymax(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ymax(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_ymin(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_ymin(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_z(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_z(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_zmax(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_zmax(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_zmflag(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_zmflag(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_zmin(extensions.box3d); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_zmin(extensions.box3d) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION unlockrows(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.unlockrows(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION updategeometrysrid(character varying, character varying, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.updategeometrysrid(character varying, character varying, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.updategeometrysrid(character varying, character varying, character varying, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION nearby(lng double precision, lat double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.nearby(lng double precision, lat double precision) TO anon;
GRANT ALL ON FUNCTION public.nearby(lng double precision, lat double precision) TO authenticated;
GRANT ALL ON FUNCTION public.nearby(lng double precision, lat double precision) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION channel_name(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.channel_name() TO postgres;
GRANT ALL ON FUNCTION realtime.channel_name() TO dashboard_user;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: FUNCTION st_3dextent(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_3dextent(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asflatgeobuf(anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asflatgeobuf(anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asflatgeobuf(anyelement, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asflatgeobuf(anyelement, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asflatgeobuf(anyelement, boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asflatgeobuf(anyelement, boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeobuf(anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeobuf(anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asgeobuf(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asgeobuf(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvt(anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvt(anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvt(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvt(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvt(anyelement, text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvt(anyelement, text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvt(anyelement, text, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvt(anyelement, text, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_asmvt(anyelement, text, integer, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_asmvt(anyelement, text, integer, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterintersecting(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterintersecting(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_clusterwithin(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_clusterwithin(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_collect(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_collect(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_extent(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_extent(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_makeline(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_makeline(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_memcollect(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_memcollect(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_memunion(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_memunion(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_polygonize(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_polygonize(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_union(extensions.geometry); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_union(extensions.geometry) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION st_union(extensions.geometry, double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.st_union(extensions.geometry, double precision) TO postgres WITH GRANT OPTION;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;


--
-- Name: TABLE geography_columns; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.geography_columns TO postgres WITH GRANT OPTION;


--
-- Name: TABLE geometry_columns; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.geometry_columns TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE spatial_ref_sys; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.spatial_ref_sys TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE affair; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.affair TO anon;
GRANT ALL ON TABLE public.affair TO authenticated;
GRANT ALL ON TABLE public.affair TO service_role;


--
-- Name: SEQUENCE "Event_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Event_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Event_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Event_id_seq" TO service_role;


--
-- Name: TABLE person; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.person TO anon;
GRANT ALL ON TABLE public.person TO authenticated;
GRANT ALL ON TABLE public.person TO service_role;


--
-- Name: SEQUENCE "User_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."User_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."User_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."User_id_seq" TO service_role;


--
-- Name: TABLE "group"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."group" TO anon;
GRANT ALL ON TABLE public."group" TO authenticated;
GRANT ALL ON TABLE public."group" TO service_role;


--
-- Name: SEQUENCE group_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.group_id_seq TO anon;
GRANT ALL ON SEQUENCE public.group_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.group_id_seq TO service_role;


--
-- Name: TABLE group_membership; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.group_membership TO anon;
GRANT ALL ON TABLE public.group_membership TO authenticated;
GRANT ALL ON TABLE public.group_membership TO service_role;


--
-- Name: SEQUENCE group_membership_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.group_membership_id_seq TO anon;
GRANT ALL ON SEQUENCE public.group_membership_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.group_membership_id_seq TO service_role;


--
-- Name: TABLE location; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.location TO anon;
GRANT ALL ON TABLE public.location TO authenticated;
GRANT ALL ON TABLE public.location TO service_role;


--
-- Name: SEQUENCE location_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.location_id_seq TO anon;
GRANT ALL ON SEQUENCE public.location_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.location_id_seq TO service_role;


--
-- Name: TABLE broadcasts; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.broadcasts TO postgres;
GRANT ALL ON TABLE realtime.broadcasts TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO service_role;


--
-- Name: SEQUENCE broadcasts_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.broadcasts_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.broadcasts_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO service_role;


--
-- Name: TABLE channels; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.channels TO postgres;
GRANT ALL ON TABLE realtime.channels TO dashboard_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO authenticated;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO service_role;


--
-- Name: SEQUENCE channels_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.channels_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.channels_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO service_role;


--
-- Name: TABLE presences; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.presences TO postgres;
GRANT ALL ON TABLE realtime.presences TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO service_role;


--
-- Name: SEQUENCE presences_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.presences_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.presences_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

