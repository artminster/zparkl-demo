--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying(75) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO zparkl_demo;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO zparkl_demo;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    email_address_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO zparkl_demo;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO zparkl_demo;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zparkl_demo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zparkl_demo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zparkl_demo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zparkl_demo;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zparkl_demo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zparkl_demo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zparkl_demo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO zparkl_demo;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO zparkl_demo;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO zparkl_demo;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    published boolean NOT NULL,
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO zparkl_demo;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO zparkl_demo;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagemoderatorstate; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_pagemoderatorstate (
    id integer NOT NULL,
    page_id integer NOT NULL,
    user_id integer,
    created timestamp with time zone NOT NULL,
    action character varying(3),
    message text NOT NULL
);


ALTER TABLE public.cms_pagemoderatorstate OWNER TO zparkl_demo;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_pagemoderatorstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderatorstate_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_pagemoderatorstate_id_seq OWNED BY cms_pagemoderatorstate.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO zparkl_demo;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO zparkl_demo;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO zparkl_demo;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO zparkl_demo;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    menu_title character varying(255),
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    application_urls character varying(200),
    redirect character varying(255),
    meta_description text,
    meta_keywords character varying(255),
    page_title character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_title OWNER TO zparkl_demo;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO zparkl_demo;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cmsplugin_file; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_file (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.cmsplugin_file OWNER TO zparkl_demo;

--
-- Name: cmsplugin_flash; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_flash (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL
);


ALTER TABLE public.cmsplugin_flash OWNER TO zparkl_demo;

--
-- Name: cmsplugin_googlemap; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_googlemap (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(100),
    address character varying(150) NOT NULL,
    zipcode character varying(30) NOT NULL,
    city character varying(100) NOT NULL,
    content character varying(255) NOT NULL,
    zoom smallint NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    route_planer_title character varying(150),
    route_planer boolean NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL,
    CONSTRAINT cmsplugin_googlemap_zoom_check CHECK ((zoom >= 0))
);


ALTER TABLE public.cmsplugin_googlemap OWNER TO zparkl_demo;

--
-- Name: cmsplugin_link; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_link (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(200),
    page_link_id integer,
    mailto character varying(75),
    target character varying(100) NOT NULL
);


ALTER TABLE public.cmsplugin_link OWNER TO zparkl_demo;

--
-- Name: cmsplugin_picture; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_picture (
    cmsplugin_ptr_id integer NOT NULL,
    image character varying(100) NOT NULL,
    url character varying(255),
    page_link_id integer,
    alt character varying(255),
    longdesc character varying(255),
    "float" character varying(10)
);


ALTER TABLE public.cmsplugin_picture OWNER TO zparkl_demo;

--
-- Name: cmsplugin_snippetptr; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_snippetptr (
    cmsplugin_ptr_id integer NOT NULL,
    snippet_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_snippetptr OWNER TO zparkl_demo;

--
-- Name: cmsplugin_teaser; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_teaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    page_link_id integer,
    url character varying(255),
    description text
);


ALTER TABLE public.cmsplugin_teaser OWNER TO zparkl_demo;

--
-- Name: cmsplugin_text; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cmsplugin_text OWNER TO zparkl_demo;

--
-- Name: cmsplugin_video; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE cmsplugin_video (
    cmsplugin_ptr_id integer NOT NULL,
    movie character varying(100),
    movie_url character varying(255),
    image character varying(100),
    width smallint NOT NULL,
    height smallint NOT NULL,
    auto_play boolean NOT NULL,
    auto_hide boolean NOT NULL,
    fullscreen boolean NOT NULL,
    loop boolean NOT NULL,
    bgcolor character varying(6) NOT NULL,
    textcolor character varying(6) NOT NULL,
    seekbarcolor character varying(6) NOT NULL,
    seekbarbgcolor character varying(6) NOT NULL,
    loadingbarcolor character varying(6) NOT NULL,
    buttonoutcolor character varying(6) NOT NULL,
    buttonovercolor character varying(6) NOT NULL,
    buttonhighlightcolor character varying(6) NOT NULL,
    CONSTRAINT cmsplugin_video_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_video_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_video OWNER TO zparkl_demo;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO zparkl_demo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zparkl_demo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO zparkl_demo;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO zparkl_demo;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk text NOT NULL,
    site_id integer NOT NULL,
    user_id integer,
    user_name character varying(50) NOT NULL,
    user_email character varying(75) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL
);


ALTER TABLE public.django_comments OWNER TO zparkl_demo;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO zparkl_demo;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zparkl_demo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zparkl_demo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zparkl_demo;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO zparkl_demo;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO zparkl_demo;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO zparkl_demo;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO zparkl_demo;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: openid_openidnonce; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE openid_openidnonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.openid_openidnonce OWNER TO zparkl_demo;

--
-- Name: openid_openidnonce_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE openid_openidnonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.openid_openidnonce_id_seq OWNER TO zparkl_demo;

--
-- Name: openid_openidnonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE openid_openidnonce_id_seq OWNED BY openid_openidnonce.id;


--
-- Name: openid_openidstore; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE openid_openidstore (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret text NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type text NOT NULL
);


ALTER TABLE public.openid_openidstore OWNER TO zparkl_demo;

--
-- Name: openid_openidstore_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE openid_openidstore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.openid_openidstore_id_seq OWNER TO zparkl_demo;

--
-- Name: openid_openidstore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE openid_openidstore_id_seq OWNED BY openid_openidstore.id;


--
-- Name: posts_comment; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE posts_comment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    text text NOT NULL,
    total_likes integer NOT NULL,
    CONSTRAINT posts_comment_total_likes_check CHECK ((total_likes >= 0))
);


ALTER TABLE public.posts_comment OWNER TO zparkl_demo;

--
-- Name: posts_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE posts_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_comment_id_seq OWNER TO zparkl_demo;

--
-- Name: posts_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE posts_comment_id_seq OWNED BY posts_comment.id;


--
-- Name: posts_like; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE posts_like (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT posts_like_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.posts_like OWNER TO zparkl_demo;

--
-- Name: posts_like_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE posts_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_like_id_seq OWNER TO zparkl_demo;

--
-- Name: posts_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE posts_like_id_seq OWNED BY posts_like.id;


--
-- Name: posts_post; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE posts_post (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    text text NOT NULL,
    image character varying(100) NOT NULL,
    category smallint NOT NULL,
    total_comments integer NOT NULL,
    total_likes integer NOT NULL,
    CONSTRAINT posts_post_category_check CHECK ((category >= 0)),
    CONSTRAINT posts_post_total_comments_check CHECK ((total_comments >= 0)),
    CONSTRAINT posts_post_total_likes_check CHECK ((total_likes >= 0))
);


ALTER TABLE public.posts_post OWNER TO zparkl_demo;

--
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_id_seq OWNER TO zparkl_demo;

--
-- Name: posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE posts_post_id_seq OWNED BY posts_post.id;


--
-- Name: snippet_snippet; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE snippet_snippet (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    html text NOT NULL,
    template character varying(50) NOT NULL
);


ALTER TABLE public.snippet_snippet OWNER TO zparkl_demo;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE snippet_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.snippet_snippet_id_seq OWNER TO zparkl_demo;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE snippet_snippet_id_seq OWNED BY snippet_snippet.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    user_id integer NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    key character varying(100) NOT NULL,
    secret character varying(100) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    app_id integer NOT NULL,
    account_id integer NOT NULL,
    token character varying(500) NOT NULL,
    token_secret character varying(500),
    expiry_date timestamp with time zone
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO zparkl_demo;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO zparkl_demo;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO zparkl_demo;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: zparkl_demo_profile_userprofile; Type: TABLE; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE TABLE zparkl_demo_profile_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    bio text,
    profile_image character varying(255) NOT NULL
);


ALTER TABLE public.zparkl_demo_profile_userprofile OWNER TO zparkl_demo;

--
-- Name: zparkl_demo_profile_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: zparkl_demo
--

CREATE SEQUENCE zparkl_demo_profile_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zparkl_demo_profile_userprofile_id_seq OWNER TO zparkl_demo;

--
-- Name: zparkl_demo_profile_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zparkl_demo
--

ALTER SEQUENCE zparkl_demo_profile_userprofile_id_seq OWNED BY zparkl_demo_profile_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagemoderatorstate ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderatorstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY openid_openidnonce ALTER COLUMN id SET DEFAULT nextval('openid_openidnonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY openid_openidstore ALTER COLUMN id SET DEFAULT nextval('openid_openidstore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_comment ALTER COLUMN id SET DEFAULT nextval('posts_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_like ALTER COLUMN id SET DEFAULT nextval('posts_like_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_post ALTER COLUMN id SET DEFAULT nextval('posts_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY snippet_snippet ALTER COLUMN id SET DEFAULT nextval('snippet_snippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY zparkl_demo_profile_userprofile ALTER COLUMN id SET DEFAULT nextval('zparkl_demo_profile_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY account_emailaddress (id, user_id, email, verified, "primary") FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 1, false);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY account_emailconfirmation (id, email_address_id, created, sent, key) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add comment	8	add_comment
23	Can change comment	8	change_comment
24	Can delete comment	8	delete_comment
25	Can moderate comments	8	can_moderate
26	Can add comment flag	9	add_commentflag
27	Can change comment flag	9	change_commentflag
28	Can delete comment flag	9	delete_commentflag
29	Can add migration history	10	add_migrationhistory
30	Can change migration history	10	change_migrationhistory
31	Can delete migration history	10	delete_migrationhistory
32	Can add user profile	11	add_userprofile
33	Can change user profile	11	change_userprofile
34	Can delete user profile	11	delete_userprofile
35	Can add email address	12	add_emailaddress
36	Can change email address	12	change_emailaddress
37	Can delete email address	12	delete_emailaddress
38	Can add email confirmation	13	add_emailconfirmation
39	Can change email confirmation	13	change_emailconfirmation
40	Can delete email confirmation	13	delete_emailconfirmation
41	Can add social app	14	add_socialapp
42	Can change social app	14	change_socialapp
43	Can delete social app	14	delete_socialapp
44	Can add social account	15	add_socialaccount
45	Can change social account	15	change_socialaccount
46	Can delete social account	15	delete_socialaccount
47	Can add social token	16	add_socialtoken
48	Can change social token	16	change_socialtoken
49	Can delete social token	16	delete_socialtoken
50	Can add open id store	17	add_openidstore
51	Can change open id store	17	change_openidstore
52	Can delete open id store	17	delete_openidstore
53	Can add open id nonce	18	add_openidnonce
54	Can change open id nonce	18	change_openidnonce
55	Can delete open id nonce	18	delete_openidnonce
56	Can publish Page	19	publish_page
57	Can add placeholder	20	add_placeholder
58	Can change placeholder	20	change_placeholder
59	Can delete placeholder	20	delete_placeholder
60	Can add cms plugin	21	add_cmsplugin
61	Can change cms plugin	21	change_cmsplugin
62	Can delete cms plugin	21	delete_cmsplugin
63	Can add page	19	add_page
64	Can change page	19	change_page
65	Can delete page	19	delete_page
66	Can view page	19	view_page
67	Can add Page moderator state	22	add_pagemoderatorstate
68	Can change Page moderator state	22	change_pagemoderatorstate
69	Can delete Page moderator state	22	delete_pagemoderatorstate
70	Can add Page global permission	23	add_globalpagepermission
71	Can change Page global permission	23	change_globalpagepermission
72	Can delete Page global permission	23	delete_globalpagepermission
73	Can add Page permission	24	add_pagepermission
74	Can change Page permission	24	change_pagepermission
75	Can delete Page permission	24	delete_pagepermission
76	Can add User (page)	25	add_pageuser
77	Can change User (page)	25	change_pageuser
78	Can delete User (page)	25	delete_pageuser
79	Can add User group (page)	26	add_pageusergroup
80	Can change User group (page)	26	change_pageusergroup
81	Can delete User group (page)	26	delete_pageusergroup
82	Can add title	27	add_title
83	Can change title	27	change_title
84	Can delete title	27	delete_title
85	Can add cache key	28	add_cachekey
86	Can change cache key	28	change_cachekey
87	Can delete cache key	28	delete_cachekey
88	Can add text	29	add_text
89	Can change text	29	change_text
90	Can delete text	29	delete_text
91	Can add picture	30	add_picture
92	Can change picture	30	change_picture
93	Can delete picture	30	delete_picture
94	Can add file	31	add_file
95	Can change file	31	change_file
96	Can delete file	31	delete_file
97	Can add link	32	add_link
98	Can change link	32	change_link
99	Can delete link	32	delete_link
100	Can add Snippet	33	add_snippet
101	Can change Snippet	33	change_snippet
102	Can delete Snippet	33	delete_snippet
103	Can add Snippet	34	add_snippetptr
104	Can change Snippet	34	change_snippetptr
105	Can delete Snippet	34	delete_snippetptr
106	Can add flash	35	add_flash
107	Can change flash	35	change_flash
108	Can delete flash	35	delete_flash
109	Can add google map	36	add_googlemap
110	Can change google map	36	change_googlemap
111	Can delete google map	36	delete_googlemap
112	Can add teaser	37	add_teaser
113	Can change teaser	37	change_teaser
114	Can delete teaser	37	delete_teaser
115	Can add video	38	add_video
116	Can change video	38	change_video
117	Can delete video	38	delete_video
118	Can add post	39	add_post
119	Can change post	39	change_post
120	Can delete post	39	delete_post
121	Can add comment	40	add_comment
122	Can change comment	40	change_comment
123	Can delete comment	40	delete_comment
124	Can add like	41	add_like
125	Can change like	41	change_like
126	Can delete like	41	delete_like
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_permission_id_seq', 126, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$10000$lw7XiO71dhqW$AxzRZZPu5aDcEIWrdjonczQyenXO0FDtoEqC2GHcSGc=	2013-12-18 17:47:39+00	t	admin	Nelson	Monteiro	work@nelsonmonteiro.net	t	t	2013-12-18 16:58:13+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
1	2	\N	0	en	TextPlugin	2013-12-19 22:31:24.235814+00	2013-12-19 22:32:46.224146+00	0	1	2	1
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 1, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, published, template, site_id, level, lft, rght, tree_id, login_required, limit_visibility_in_menu, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
2	admin	admin	\N	2013-12-18 17:49:23.765831+00	2013-12-19 22:30:55.35052+00	2013-12-18 17:48:35+00	\N	f	f	home		t	zparkl_demo/home/index.html	1	0	1	2	2	f	\N	f	1	0
1	admin	admin	\N	2013-12-18 17:48:06.054849+00	2013-12-19 22:32:46.256192+00	2013-12-18 17:48:35+00	\N	f	f	home		t	zparkl_demo/home/index.html	1	0	1	2	1	f	\N	t	2	1
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_page_id_seq', 2, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 4, true);


--
-- Data for Name: cms_pagemoderatorstate; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_pagemoderatorstate (id, page_id, user_id, created, action, message) FROM stdin;
2	1	1	2013-12-19 22:31:53.339241+00	CHA	
3	1	1	2013-12-19 22:32:46.235927+00	CHA	
\.


--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_pagemoderatorstate_id_seq', 3, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	body	\N
2	intro	\N
3	intro	\N
4	body	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 4, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, application_urls, redirect, meta_description, meta_keywords, page_title, page_id, creation_date) FROM stdin;
1	en	Homepage	Home	home		f						1	2013-12-18 17:48:06.188923+00
2	en	Homepage	Home	home		f						2	2013-12-18 17:48:06.188923+00
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('cms_title_id_seq', 2, true);


--
-- Data for Name: cmsplugin_file; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_file (cmsplugin_ptr_id, file, title) FROM stdin;
\.


--
-- Data for Name: cmsplugin_flash; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_flash (cmsplugin_ptr_id, file, width, height) FROM stdin;
\.


--
-- Data for Name: cmsplugin_googlemap; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_googlemap (cmsplugin_ptr_id, title, address, zipcode, city, content, zoom, lat, lng, route_planer_title, route_planer, width, height) FROM stdin;
\.


--
-- Data for Name: cmsplugin_link; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_link (cmsplugin_ptr_id, name, url, page_link_id, mailto, target) FROM stdin;
\.


--
-- Data for Name: cmsplugin_picture; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_picture (cmsplugin_ptr_id, image, url, page_link_id, alt, longdesc, "float") FROM stdin;
\.


--
-- Data for Name: cmsplugin_snippetptr; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_snippetptr (cmsplugin_ptr_id, snippet_id) FROM stdin;
\.


--
-- Data for Name: cmsplugin_teaser; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_teaser (cmsplugin_ptr_id, title, image, page_link_id, url, description) FROM stdin;
\.


--
-- Data for Name: cmsplugin_text; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_text (cmsplugin_ptr_id, body) FROM stdin;
1	<p>The purpose of this page is just to send samples of my coding. On this project, you can find examples from different fields (frontend, backend and server configurations).</p>
\.


--
-- Data for Name: cmsplugin_video; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY cmsplugin_video (cmsplugin_ptr_id, movie, movie_url, image, width, height, auto_play, auto_hide, fullscreen, loop, bgcolor, textcolor, seekbarcolor, seekbarbgcolor, loadingbarcolor, buttonoutcolor, buttonovercolor, buttonhighlightcolor) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-12-18 17:48:06.223289+00	1	19	1		1	
2	2013-12-18 17:48:40.425554+00	1	19	1		2	Changed menu_title, published, reverse_id and language.
3	2013-12-18 20:50:29.50921+00	1	39	2	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. \r\n\r\nNam vitae velit vel mi volutpat mattis non nec augue. Morbi	1	
4	2013-12-18 21:26:44.107194+00	1	39	2	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. \r\n\r\nNam vitae velit vel mi volutpat mattis non nec augue. Morbi	2	Changed image.
5	2013-12-19 00:32:36.789352+00	1	3	1	admin	2	Changed password, first_name and last_name.
6	2013-12-19 17:19:00.525762+00	1	39	2	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. Nam vitae velit vel mi volutpat mattis non nec augue. Morbi eu 	2	Changed text.
7	2013-12-19 17:47:13.174998+00	1	3	1	admin	2	Changed password. Changed profile_image for user profile "Nelson Monteiro".
8	2013-12-19 18:21:24.471248+00	1	39	2	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. Nam vitae velit vel mi volutpat mattis non nec augue. Morbi eu 	2	Added comment "Sed nisl sapien, venenatis ac sollicitudin ut, volutpat vitae quam. Pellentesque quis libero quis sapien placerat ullamcorper. Morbi eget hendrerit augue, eu auctor urna. Donec interdum sed orci sed placerat. Mauris lacinia non diam sit amet venenatis.". Added comment "Etiam lacinia rhoncus purus, non sagittis leo sagittis sit amet. Cras scelerisque gravida venenatis. Nunc rutrum feugiat mauris eget dignissim. Aenean quis euismod magna.".
9	2013-12-19 22:16:02.394279+00	1	39	2	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. Nam vitae velit vel mi volutpat mattis non nec augue. Morbi eu 	2	Deleted comment "Class aptent taciti sociosqu ad litora torquent per conubia nostra.". Deleted comment "data". Deleted comment "sadasd". Deleted comment "dsfa sdf asdf adsfa d". Deleted comment "sadfa sdfa dsfa dsf asdfa ds". Deleted comment "adsf sdfa dsfa dsfa dsfa sd". Deleted comment "adfa dsfa dsfa dsl;fa dsf;la dsfa\r\nddf adsf adsf adskf aldskf ladsk fladsk". Deleted comment "afsdfa sd\r\nf a\r\nsdf a\r\nsdlfapdslf \r\na;sdl fa\r\nsdl f\r\nasd ". Deleted comment "dfa dsfa\r\nsdfa\r\ndsf\r\na dsflads;f\r\nald s;fa\r\nds\r\nfadsa". Deleted comment "sdfak sdlf kalsdk falsdkf aldsfa ds\r\nfa ds\r\nfa ds\r\nfa sd\r\nf". Deleted comment "fasdfd sflasd;lf asdflds ". Deleted comment "fadsfalsd f;alds ;fal ds;falds ".
10	2013-12-19 22:30:31.726367+00	1	19	1		2	Changed template and language.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 10, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_comment_flags (id, user_id, comment_id, flag, flag_date) FROM stdin;
\.


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_comments (id, content_type_id, object_pk, site_id, user_id, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed) FROM stdin;
\.


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	comment	comments	comment
9	comment flag	comments	commentflag
10	migration history	south	migrationhistory
11	user profile	zparkl_demo_profile	userprofile
12	email address	account	emailaddress
13	email confirmation	account	emailconfirmation
14	social app	socialaccount	socialapp
15	social account	socialaccount	socialaccount
16	social token	socialaccount	socialtoken
17	open id store	openid	openidstore
18	open id nonce	openid	openidnonce
19		cms	page
20	placeholder	cms	placeholder
21	cms plugin	cms	cmsplugin
22	Page moderator state	cms	pagemoderatorstate
23	Page global permission	cms	globalpagepermission
24	Page permission	cms	pagepermission
25	User (page)	cms	pageuser
26	User group (page)	cms	pageusergroup
27	title	cms	title
28	cache key	menus	cachekey
29	text	text	text
30	picture	picture	picture
31	file	file	file
32	link	link	link
33	Snippet	snippet	snippet
34	Snippet	snippet	snippetptr
35	flash	flash	flash
36	google map	googlemap	googlemap
37	teaser	teaser	teaser
38	video	video	video
39	post	posts	post
40	comment	posts	comment
41	like	posts	like
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('django_content_type_id_seq', 41, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
z2wdg3zge620p8h44aqvxmtwku6n2udj	OGQ3MWVhMjhkZGY4NjAzMWUzYzhiMzMxNGVlYzNlNGVhZTkyMjMzMDqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWRLAXUu	2014-01-02 22:30:55.820158+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 1, true);


--
-- Data for Name: openid_openidnonce; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY openid_openidnonce (id, server_url, "timestamp", salt, date_created) FROM stdin;
\.


--
-- Name: openid_openidnonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('openid_openidnonce_id_seq', 1, false);


--
-- Data for Name: openid_openidstore; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY openid_openidstore (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: openid_openidstore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('openid_openidstore_id_seq', 1, false);


--
-- Data for Name: posts_comment; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY posts_comment (id, created, updated, post_id, user_id, text, total_likes) FROM stdin;
3	2013-12-19 18:21:24.449802+00	2013-12-19 18:21:24.449845+00	2	1	Sed nisl sapien, venenatis ac sollicitudin ut, volutpat vitae quam. Pellentesque quis libero quis sapien placerat ullamcorper. Morbi eget hendrerit augue, eu auctor urna. Donec interdum sed orci sed placerat. Mauris lacinia non diam sit amet venenatis.	0
4	2013-12-19 18:21:24.461487+00	2013-12-19 18:21:24.461521+00	2	1	Etiam lacinia rhoncus purus, non sagittis leo sagittis sit amet. Cras scelerisque gravida venenatis. Nunc rutrum feugiat mauris eget dignissim. Aenean quis euismod magna.	0
5	2013-12-19 22:04:49.471191+00	2013-12-19 22:04:49.471236+00	2	1	Curabitur sagittis et nibh ut accumsan. Ut mi dui, malesuada non enim a, interdum dapibus ante. Duis vitae ante et tellus tristique accumsan a congue magna. Phasellus eu commodo massa.	0
\.


--
-- Name: posts_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('posts_comment_id_seq', 16, true);


--
-- Data for Name: posts_like; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY posts_like (id, created, updated, content_type_id, object_id, user_id) FROM stdin;
\.


--
-- Name: posts_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('posts_like_id_seq', 1, false);


--
-- Data for Name: posts_post; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY posts_post (id, created, updated, title, text, image, category, total_comments, total_likes) FROM stdin;
2	2013-12-18 20:50:29.48546+00	2013-12-19 22:16:02.390157+00	Lorem ipsum dolor sit amet, consectetur adipiscing elit	Praesent magna ligula, interdum vulputate condimentum eget, facilisis ut neque. Ut non lacus rhoncus, faucibus urna vel, facilisis nisl. Nam vitae velit vel mi volutpat mattis non nec augue. Morbi eu malesuada orci. Duis fermentum lacus non dolor molestie, et varius ligula fermentum. Sed lacinia ligula urna, eget venenatis libero laoreet eu. Vivamus aliquam lacinia ipsum sit amet fringilla. Mauris sollicitudin tristique diam. \r\n\r\nQuisque consequat lacinia arcu. Pellentesque commodo orci lectus, nec ultrices magna tempor ac. Integer in commodo velit. Etiam vestibulum nunc eu magna eleifend vestibulum. Maecenas facilisis rhoncus mi nec auctor. Nulla facilisi.	uploads/posts/images/nsexv48gr6roxpu1x6f2.jpg	1	3	0
\.


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('posts_post_id_seq', 2, true);


--
-- Data for Name: snippet_snippet; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY snippet_snippet (id, name, html, template) FROM stdin;
\.


--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('snippet_snippet_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY socialaccount_socialaccount (id, user_id, last_login, date_joined, provider, uid, extra_data) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY socialaccount_socialapp (id, provider, name, key, secret) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY socialaccount_socialtoken (id, app_id, account_id, token, token_secret, expiry_date) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	django_extensions	0001_empty	2013-12-18 16:58:21.392233+00
2	account	0001_initial	2013-12-18 16:58:21.547274+00
3	socialaccount	0001_initial	2013-12-18 16:58:21.692019+00
4	socialaccount	0002_genericmodels	2013-12-18 16:58:22.033393+00
5	socialaccount	0003_auto__add_unique_socialaccount_uid_provider	2013-12-18 16:58:22.06582+00
6	socialaccount	0004_add_sites	2013-12-18 16:58:22.118221+00
7	socialaccount	0005_set_sites	2013-12-18 16:58:22.14651+00
8	socialaccount	0006_auto__del_field_socialapp_site	2013-12-18 16:58:22.206356+00
9	socialaccount	0007_auto__add_field_socialtoken_expiry_date	2013-12-18 16:58:22.239497+00
10	socialaccount	0008_auto__chg_field_socialtoken_token__chg_field_socialtoken_token_secret	2013-12-18 16:58:22.411056+00
11	socialaccount	0009_auto__chg_field_socialtoken_token_secret	2013-12-18 16:58:22.580239+00
12	twitter	0001_initial	2013-12-18 16:58:22.757535+00
13	twitter	0002_snowflake	2013-12-18 16:58:22.868038+00
14	twitter	0003_tosocialaccount	2013-12-18 16:58:22.905205+00
15	twitter	0004_auto__del_twitteraccount__del_twitterapp	2013-12-18 16:58:22.916842+00
16	openid	0001_initial	2013-12-18 16:58:23.079141+00
17	openid	0002_tosocialaccount	2013-12-18 16:58:23.115967+00
18	openid	0003_auto__del_openidaccount	2013-12-18 16:58:23.128181+00
19	facebook	0001_initial	2013-12-18 16:58:23.299094+00
20	facebook	0002_auto__add_facebookaccesstoken__add_unique_facebookaccesstoken_app_acco	2013-12-18 16:58:23.424313+00
21	facebook	0003_tosocialaccount	2013-12-18 16:58:23.462261+00
22	facebook	0004_auto__del_facebookapp__del_facebookaccesstoken__del_unique_facebookacc	2013-12-18 16:58:23.518549+00
23	cms	0001_initial	2013-12-18 16:58:24.180094+00
24	cms	0002_auto_start	2013-12-18 16:58:24.245517+00
25	cms	0003_remove_placeholder	2013-12-18 16:58:24.307805+00
26	cms	0004_textobjects	2013-12-18 16:58:24.365588+00
27	cms	0005_mptt_added_to_plugins	2013-12-18 16:58:24.431932+00
28	cms	0006_apphook	2013-12-18 16:58:24.489701+00
29	cms	0007_apphook_longer	2013-12-18 16:58:24.544526+00
30	cms	0008_redirects	2013-12-18 16:58:24.609344+00
31	cms	0009_added_meta_fields	2013-12-18 16:58:24.672687+00
32	cms	0010_5char_language	2013-12-18 16:58:24.735038+00
33	cms	0011_title_overwrites	2013-12-18 16:58:24.792638+00
34	cms	0012_publisher	2013-12-18 16:58:24.846431+00
35	cms	0013_site_copy	2013-12-18 16:58:24.906807+00
36	cms	0014_sites_removed	2013-12-18 16:58:24.960294+00
37	cms	0015_modified_by_added	2013-12-18 16:58:25.020785+00
38	cms	0016_author_copy	2013-12-18 16:58:25.134484+00
39	cms	0017_author_removed	2013-12-18 16:58:25.195524+00
40	cms	0018_site_permissions	2013-12-18 16:58:25.265242+00
41	cms	0019_public_table_renames	2013-12-18 16:58:25.32188+00
42	cms	0020_advanced_permissions	2013-12-18 16:58:25.382194+00
43	cms	0021_publisher2	2013-12-18 16:58:25.443537+00
44	cms	0022_login_required_added	2013-12-18 16:58:25.5055+00
45	cms	0023_plugin_table_naming_function_changed	2013-12-18 16:58:25.570074+00
46	cms	0024_added_placeholder_model	2013-12-18 16:58:25.629075+00
47	cms	0025_placeholder_migration	2013-12-18 16:58:25.69139+00
48	cms	0026_finish_placeholder_migration	2013-12-18 16:58:25.8761+00
49	cms	0027_added_width_to_placeholder	2013-12-18 16:58:25.931558+00
50	cms	0028_limit_visibility_in_menu_step1of3	2013-12-18 16:58:25.994133+00
51	cms	0029_limit_visibility_in_menu_step2of3_data	2013-12-18 16:58:26.052605+00
52	cms	0030_limit_visibility_in_menu_step3of3	2013-12-18 16:58:26.11569+00
53	cms	0031_improved_language_code_support	2013-12-18 16:58:26.184345+00
54	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2013-12-18 16:58:26.272383+00
55	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2013-12-18 16:58:26.337519+00
56	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2013-12-18 16:58:26.406734+00
57	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2013-12-18 16:58:26.465732+00
58	cms	0036_auto__add_field_cmsplugin_changed_date	2013-12-18 16:58:26.532417+00
59	cms	0037_auto__del_pagemoderator__del_field_globalpagepermission_can_moderate__	2013-12-18 16:58:26.598393+00
60	cms	0038_publish_page_permission	2013-12-18 16:58:26.675597+00
61	cms	0039_auto__del_field_page_moderator_state	2013-12-18 16:58:26.734788+00
62	menus	0001_initial	2013-12-18 16:58:26.893779+00
63	text	0001_initial	2013-12-18 16:58:27.02925+00
64	text	0002_freeze	2013-12-18 16:58:27.040906+00
65	text	0003_publisher	2013-12-18 16:58:27.051378+00
66	text	0004_table_rename	2013-12-18 16:58:27.063052+00
67	text	0005_publisher2	2013-12-18 16:58:27.081338+00
68	text	0006_2_1_4_upgrade	2013-12-18 16:58:27.094085+00
69	picture	0001_initial	2013-12-18 16:58:27.422843+00
70	picture	0002_link_rename	2013-12-18 16:58:27.446303+00
71	picture	0003_freeze	2013-12-18 16:58:27.467421+00
72	picture	0004_publisher	2013-12-18 16:58:27.492611+00
73	picture	0005_table_rename	2013-12-18 16:58:27.515713+00
74	picture	0006_float_added	2013-12-18 16:58:27.536876+00
75	picture	0007_publisher2	2013-12-18 16:58:27.564179+00
76	picture	0008_longdesc_added	2013-12-18 16:58:27.594108+00
77	file	0001_initial	2013-12-18 16:58:27.732366+00
78	file	0002_freeze	2013-12-18 16:58:27.745544+00
79	file	0003_publisher	2013-12-18 16:58:27.76124+00
80	file	0004_table_rename	2013-12-18 16:58:27.771652+00
81	file	0005_publisher2	2013-12-18 16:58:27.782775+00
82	link	0001_initial	2013-12-18 16:58:27.960078+00
83	link	0002_link_rename	2013-12-18 16:58:27.983452+00
84	link	0003_page_link	2013-12-18 16:58:28.015403+00
85	link	0004_larger_link_names	2013-12-18 16:58:28.039196+00
86	link	0005_publisher	2013-12-18 16:58:28.061619+00
87	link	0006_table_rename	2013-12-18 16:58:28.084928+00
88	link	0007_publisher2	2013-12-18 16:58:28.11088+00
89	link	0008_mailto	2013-12-18 16:58:28.131703+00
90	link	0009_add_target	2013-12-18 16:58:28.157747+00
91	snippet	0001_initial	2013-12-18 16:58:28.520093+00
92	snippet	0002_publisher	2013-12-18 16:58:28.533662+00
93	snippet	0003_table_rename	2013-12-18 16:58:28.545665+00
94	snippet	0004_publisher2	2013-12-18 16:58:28.562109+00
95	snippet	0005_template_added	2013-12-18 16:58:28.577829+00
96	flash	0001_initial	2013-12-18 16:58:28.723293+00
97	flash	0002_freeze	2013-12-18 16:58:28.741812+00
98	flash	0003_publisher	2013-12-18 16:58:28.754085+00
99	flash	0004_table_rename	2013-12-18 16:58:28.764365+00
100	flash	0005_publisher2	2013-12-18 16:58:28.774678+00
101	googlemap	0001_initial	2013-12-18 16:58:28.918087+00
102	googlemap	0002_table_rename	2013-12-18 16:58:28.931565+00
103	googlemap	0003_address_unified	2013-12-18 16:58:28.944654+00
104	googlemap	0004_copy_address	2013-12-18 16:58:28.957431+00
105	googlemap	0005_delete_street	2013-12-18 16:58:28.970309+00
106	googlemap	0006_publisher2	2013-12-18 16:58:28.983459+00
107	googlemap	0007_latlng	2013-12-18 16:58:29.005654+00
108	googlemap	0008_routeplaner	2013-12-18 16:58:29.019235+00
109	googlemap	0009_routeplaner_title	2013-12-18 16:58:29.03126+00
110	googlemap	0010_auto__chg_field_googlemap_content	2013-12-18 16:58:29.070096+00
111	googlemap	0011_remove_zoom_null_values	2013-12-18 16:58:29.093413+00
112	googlemap	0012_auto__add_field_googlemap_width__add_field_googlemap_height__chg_field	2013-12-18 16:58:29.113761+00
113	teaser	0001_initial	2013-12-18 16:58:29.281402+00
114	teaser	0002_publisher2	2013-12-18 16:58:29.304203+00
115	video	0001_initial	2013-12-18 16:58:29.758083+00
116	video	0002_color_mute_controller	2013-12-18 16:58:29.772333+00
117	video	0003_newplayer_step1	2013-12-18 16:58:29.785636+00
118	video	0004_newplayer_step2	2013-12-18 16:58:29.80019+00
119	video	0005_newplayer_step3	2013-12-18 16:58:29.813498+00
120	video	0006_newplayer_step4	2013-12-18 16:58:29.828866+00
121	video	0007_newplayer_step5	2013-12-18 16:58:29.843418+00
122	zparkl_demo_profile	0001_initial	2013-12-18 20:24:19.349866+00
123	zparkl_demo_profile	0002_auto__add_field_userprofile_profile_image	2013-12-18 20:24:28.368845+00
124	posts	0001_initial	2013-12-18 20:49:41.001706+00
125	zparkl_demo_profile	0003_auto__chg_field_userprofile_profile_image	2013-12-19 17:55:45.911626+00
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 125, true);


--
-- Data for Name: zparkl_demo_profile_userprofile; Type: TABLE DATA; Schema: public; Owner: zparkl_demo
--

COPY zparkl_demo_profile_userprofile (id, created, updated, user_id, bio, profile_image) FROM stdin;
1	2013-12-19 17:44:28.445694+00	2013-12-19 17:47:13.161128+00	1		uploads/profiles/images/uww2te9d2kaf7wlmaehc.jpg
\.


--
-- Name: zparkl_demo_profile_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zparkl_demo
--

SELECT pg_catalog.setval('zparkl_demo_profile_userprofile_id_seq', 1, true);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpageper_globalpagepermission_id_1ffcd9d4c6c0cbfa_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpageper_globalpagepermission_id_1ffcd9d4c6c0cbfa_uniq UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_598353cf6a0df834_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_598353cf6a0df834_uniq UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagemoderatorstate_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_pkey PRIMARY KEY (id);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_7a69dc7eaf856287_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_7a69dc7eaf856287_uniq UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_file_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_file_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_flash_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_flash
    ADD CONSTRAINT cmsplugin_flash_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_googlemap_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_googlemap
    ADD CONSTRAINT cmsplugin_googlemap_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_link_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_picture_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_snippetptr_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_snippetptr_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_teaser_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT cmsplugin_teaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_text_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_video_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_video
    ADD CONSTRAINT cmsplugin_video_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_comment_id_flag_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_key UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: openid_openidnonce_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY openid_openidnonce
    ADD CONSTRAINT openid_openidnonce_pkey PRIMARY KEY (id);


--
-- Name: openid_openidstore_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY openid_openidstore
    ADD CONSTRAINT openid_openidstore_pkey PRIMARY KEY (id);


--
-- Name: posts_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY posts_comment
    ADD CONSTRAINT posts_comment_pkey PRIMARY KEY (id);


--
-- Name: posts_like_content_type_id_89bb88e4618f2d5_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY posts_like
    ADD CONSTRAINT posts_like_content_type_id_89bb88e4618f2d5_uniq UNIQUE (content_type_id, object_id, user_id);


--
-- Name: posts_like_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY posts_like
    ADD CONSTRAINT posts_like_pkey PRIMARY KEY (id);


--
-- Name: posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY posts_post
    ADD CONSTRAINT posts_post_pkey PRIMARY KEY (id);


--
-- Name: snippet_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_name_key UNIQUE (name);


--
-- Name: snippet_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq UNIQUE (uid, provider);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_697928748c2e1968_uniq; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_697928748c2e1968_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: zparkl_demo_profile_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY zparkl_demo_profile_userprofile
    ADD CONSTRAINT zparkl_demo_profile_userprofile_pkey PRIMARY KEY (id);


--
-- Name: zparkl_demo_profile_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zparkl_demo; Tablespace: 
--

ALTER TABLE ONLY zparkl_demo_profile_userprofile
    ADD CONSTRAINT zparkl_demo_profile_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_email_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX account_emailaddress_email_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX account_emailaddress_user_id ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX account_emailconfirmation_email_address_id ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX account_emailconfirmation_key_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_publisher_state; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_publisher_state ON cms_page USING btree (publisher_state);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagemoderatorstate_page_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_page_id ON cms_pagemoderatorstate USING btree (page_id);


--
-- Name: cms_pagemoderatorstate_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_user_id ON cms_pagemoderatorstate USING btree (user_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_title_application_urls; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_application_urls ON cms_title USING btree (application_urls);


--
-- Name: cms_title_application_urls_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_application_urls_like ON cms_title USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cmsplugin_link_page_link_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cmsplugin_link_page_link_id ON cmsplugin_link USING btree (page_link_id);


--
-- Name: cmsplugin_picture_page_link_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cmsplugin_picture_page_link_id ON cmsplugin_picture USING btree (page_link_id);


--
-- Name: cmsplugin_snippetptr_snippet_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cmsplugin_snippetptr_snippet_id ON cmsplugin_snippetptr USING btree (snippet_id);


--
-- Name: cmsplugin_teaser_page_link_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX cmsplugin_teaser_page_link_id ON cmsplugin_teaser USING btree (page_link_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comment_flags_comment_id ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comment_flags_flag ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comment_flags_flag_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comment_flags_user_id ON django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comments_content_type_id ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comments_site_id ON django_comments USING btree (site_id);


--
-- Name: django_comments_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_comments_user_id ON django_comments USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: posts_comment_post_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX posts_comment_post_id ON posts_comment USING btree (post_id);


--
-- Name: posts_comment_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX posts_comment_user_id ON posts_comment USING btree (user_id);


--
-- Name: posts_like_content_type_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX posts_like_content_type_id ON posts_like USING btree (content_type_id);


--
-- Name: posts_like_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX posts_like_user_id ON posts_like USING btree (user_id);


--
-- Name: snippet_snippet_name_like; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX snippet_snippet_name_like ON snippet_snippet USING btree (name varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX socialaccount_socialaccount_user_id ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_site_id ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_account_id ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id; Type: INDEX; Schema: public; Owner: zparkl_demo; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_app_id ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_id_refs_id_1337a128; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT account_id_refs_id_1337a128 FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_id_refs_id_edac8a54; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT app_id_refs_id_edac8a54 FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_1639aa84; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_1639aa84 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_34ad5108; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_34ad5108 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_568ff6b7; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_568ff6b7 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_6069d307; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_6069d307 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_6e3a69f0; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_6e3a69f0 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_77bc83b6; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_googlemap
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_77bc83b6 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_7fb15e0e; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_7fb15e0e FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_ed7b02f3; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_video
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_ed7b02f3 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_faf66a7f; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_flash
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_faf66a7f FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_27ba9e65; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_like
    ADD CONSTRAINT content_type_id_refs_id_27ba9e65 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_9da6953b; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT created_by_id_refs_id_9da6953b FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_f9e2dd36; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT created_by_id_refs_id_f9e2dd36 FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: email_address_id_refs_id_6ea1eea3; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT email_address_id_refs_id_6ea1eea3 FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_09b826f9; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_09b826f9 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_5f980916; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT group_id_refs_id_5f980916 FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_65c5081c; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT group_id_refs_id_65c5081c FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_ptr_id_refs_id_b270d7fc; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT group_ptr_id_refs_id_b270d7fc FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_0d5e81b6; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT page_id_refs_id_0d5e81b6 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_88abf373; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_88abf373 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_9d95001c; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT page_id_refs_id_9d95001c FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_e5b132d9; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT page_id_refs_id_e5b132d9 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_5f4cbf5b; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT page_link_id_refs_id_5f4cbf5b FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_71e93dc6; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT page_link_id_refs_id_71e93dc6 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_d7a1a26c; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT page_link_id_refs_id_d7a1a26c FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_8d462df0; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_8d462df0 FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_ca1f299f FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_id_refs_id_0c0bdf3b; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT placeholder_id_refs_id_0c0bdf3b FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_id_refs_id_6e7caeb8; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT placeholder_id_refs_id_6e7caeb8 FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_id_refs_id_8aca36fc; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_comment
    ADD CONSTRAINT post_id_refs_id_8aca36fc FOREIGN KEY (post_id) REFERENCES posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_ca1f299f FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_05d6147e; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT site_id_refs_id_05d6147e FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_3757c4f9; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT site_id_refs_id_3757c4f9 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_5f61f09c; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT site_id_refs_id_5f61f09c FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: snippet_id_refs_id_c4f29a99; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT snippet_id_refs_id_c4f29a99 FOREIGN KEY (snippet_id) REFERENCES snippet_snippet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialapp_id_refs_id_e7a43014; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialapp_id_refs_id_e7a43014 FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_1f964794; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT user_id_refs_id_1f964794 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4aacde5e; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT user_id_refs_id_4aacde5e FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_5bdd9e6a; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_comment
    ADD CONSTRAINT user_id_refs_id_5bdd9e6a FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_b4f0248b; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT user_id_refs_id_b4f0248b FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_b89b787e; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT user_id_refs_id_b89b787e FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_d1b778b5; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY posts_like
    ADD CONSTRAINT user_id_refs_id_d1b778b5 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_e927b528; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT user_id_refs_id_e927b528 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_ptr_id_refs_id_9da6953b; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT user_ptr_id_refs_id_9da6953b FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zparkl_demo_profile_userprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zparkl_demo
--

ALTER TABLE ONLY zparkl_demo_profile_userprofile
    ADD CONSTRAINT zparkl_demo_profile_userprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

