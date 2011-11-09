--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activators (
    id integer NOT NULL,
    description character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying(255),
    event_name character varying(255),
    type character varying(255)
);


--
-- Name: activators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activators_id_seq OWNED BY activators.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    state_id integer,
    zipcode character varying(255),
    country_id integer,
    phone character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state_name character varying(255),
    alternative_phone character varying(255)
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: adjustments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE adjustments (
    id integer NOT NULL,
    order_id integer,
    amount numeric(8,2) DEFAULT NULL::numeric,
    label character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    source_id integer,
    source_type character varying(255),
    mandatory boolean,
    locked boolean,
    originator_id integer,
    originator_type character varying(255),
    eligible boolean DEFAULT true
);


--
-- Name: adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE adjustments_id_seq OWNED BY adjustments.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assets (
    id integer NOT NULL,
    viewable_id integer,
    viewable_type character varying(50),
    attachment_content_type character varying(255),
    attachment_file_name character varying(255),
    attachment_size integer,
    "position" integer,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    attachment_width integer,
    attachment_height integer,
    alt text
);


--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assets_id_seq OWNED BY assets.id;


--
-- Name: calculators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE calculators (
    id integer NOT NULL,
    type character varying(255),
    calculable_id integer NOT NULL,
    calculable_type character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE calculators_id_seq OWNED BY calculators.id;


--
-- Name: configurations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configurations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(50)
);


--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    iso_name character varying(255),
    iso character varying(255),
    name character varying(255),
    iso3 character varying(255),
    numcode integer
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: creditcards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE creditcards (
    id integer NOT NULL,
    month character varying(255),
    year character varying(255),
    cc_type character varying(255),
    last_digits character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    start_month character varying(255),
    start_year character varying(255),
    issue_number character varying(255),
    address_id integer,
    gateway_customer_profile_id character varying(255),
    gateway_payment_profile_id character varying(255)
);


--
-- Name: creditcards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE creditcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: creditcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE creditcards_id_seq OWNED BY creditcards.id;


--
-- Name: gateways; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gateways (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    server character varying(255) DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gateways_id_seq OWNED BY gateways.id;


--
-- Name: inventory_units; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inventory_units (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    state character varying(255),
    lock_version integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shipment_id integer,
    return_authorization_id integer
);


--
-- Name: inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventory_units_id_seq OWNED BY inventory_units.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE line_items (
    id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: log_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying(255),
    details text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE log_entries_id_seq OWNED BY log_entries.id;


--
-- Name: mail_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mail_methods (
    id integer NOT NULL,
    environment character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: mail_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mail_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mail_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mail_methods_id_seq OWNED BY mail_methods.id;


--
-- Name: option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer DEFAULT 0 NOT NULL
);


--
-- Name: option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE option_types_id_seq OWNED BY option_types.id;


--
-- Name: option_types_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


--
-- Name: option_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_values (
    id integer NOT NULL,
    option_type_id integer,
    name character varying(255),
    "position" integer,
    presentation character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE option_values_id_seq OWNED BY option_values.id;


--
-- Name: option_values_variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_values_variants (
    variant_id integer,
    option_value_id integer
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    number character varying(15),
    item_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    total numeric(8,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying(255),
    adjustment_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    credit_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(8,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying(255),
    payment_state character varying(255),
    email character varying(255),
    special_instructions text
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    order_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    source_id integer,
    source_type character varying(255),
    payment_method_id integer,
    state character varying(255),
    response_code character varying(255),
    avs_response character varying(255)
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(50) NOT NULL,
    group_id integer,
    group_type character varying(50),
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: product_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_groups (
    id integer NOT NULL,
    name character varying(255),
    permalink character varying(255),
    "order" character varying(255)
);


--
-- Name: product_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_groups_id_seq OWNED BY product_groups.id;


--
-- Name: product_groups_products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_groups_products (
    product_id integer,
    product_group_id integer
);


--
-- Name: product_option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_option_types (
    id integer NOT NULL,
    product_id integer,
    option_type_id integer,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_option_types_id_seq OWNED BY product_option_types.id;


--
-- Name: product_properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_properties (
    id integer NOT NULL,
    product_id integer,
    property_id integer,
    value character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_properties_id_seq OWNED BY product_properties.id;


--
-- Name: product_scopes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_scopes (
    id integer NOT NULL,
    product_group_id integer,
    name character varying(255),
    arguments text
);


--
-- Name: product_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_scopes_id_seq OWNED BY product_scopes.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    permalink character varying(255),
    available_on timestamp without time zone,
    tax_category_id integer,
    shipping_category_id integer,
    deleted_at timestamp without time zone,
    meta_description character varying(255),
    meta_keywords character varying(255),
    count_on_hand integer DEFAULT 0 NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: products_promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


--
-- Name: products_taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products_taxons (
    product_id integer,
    taxon_id integer
);


--
-- Name: promotion_action_line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


--
-- Name: promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE promotion_action_line_items_id_seq OWNED BY promotion_action_line_items.id;


--
-- Name: promotion_actions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_actions (
    id integer NOT NULL,
    activator_id integer,
    "position" integer,
    type character varying(255)
);


--
-- Name: promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE promotion_actions_id_seq OWNED BY promotion_actions.id;


--
-- Name: promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_rules (
    id integer NOT NULL,
    activator_id integer,
    user_id integer,
    product_group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(255)
);


--
-- Name: promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE promotion_rules_id_seq OWNED BY promotion_rules.id;


--
-- Name: promotion_rules_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


--
-- Name: properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    name character varying(255),
    presentation character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: properties_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE properties_prototypes (
    prototype_id integer,
    property_id integer
);


--
-- Name: prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE prototypes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prototypes_id_seq OWNED BY prototypes.id;


--
-- Name: return_authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE return_authorizations (
    id integer NOT NULL,
    number character varying(255),
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    reason text,
    state character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE return_authorizations_id_seq OWNED BY return_authorizations.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_users (
    role_id integer,
    user_id integer
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipments (
    id integer NOT NULL,
    order_id integer,
    shipping_method_id integer,
    tracking character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    number character varying(255),
    cost numeric(8,2),
    shipped_at timestamp without time zone,
    address_id integer,
    state character varying(255)
);


--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipments_id_seq OWNED BY shipments.id;


--
-- Name: shipping_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipping_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipping_categories_id_seq OWNED BY shipping_categories.id;


--
-- Name: shipping_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipping_methods (
    id integer NOT NULL,
    zone_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipping_methods_id_seq OWNED BY shipping_methods.id;


--
-- Name: state_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE state_events (
    id integer NOT NULL,
    stateful_id integer,
    user_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    previous_state character varying(255),
    stateful_type character varying(255),
    next_state character varying(255)
);


--
-- Name: state_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE state_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: state_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE state_events_id_seq OWNED BY state_events.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    abbr character varying(255),
    country_id integer
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: tax_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tax_categories (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_default boolean DEFAULT false
);


--
-- Name: tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tax_categories_id_seq OWNED BY tax_categories.id;


--
-- Name: tax_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tax_rates (
    id integer NOT NULL,
    zone_id integer,
    amount numeric(8,4),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tax_category_id integer
);


--
-- Name: tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tax_rates_id_seq OWNED BY tax_rates.id;


--
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxonomies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxonomies_id_seq OWNED BY taxonomies.id;


--
-- Name: taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxons (
    id integer NOT NULL,
    taxonomy_id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    permalink character varying(255),
    lft integer,
    rgt integer,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text
);


--
-- Name: taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxons_id_seq OWNED BY taxons.id;


--
-- Name: tokenized_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tokenized_permissions (
    id integer NOT NULL,
    permissable_id integer,
    permissable_type character varying(255),
    token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tokenized_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tokenized_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokenized_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tokenized_permissions_id_seq OWNED BY tokenized_permissions.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackers (
    id integer NOT NULL,
    environment character varying(255),
    analytics_id character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trackers_id_seq OWNED BY trackers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    encrypted_password character varying(255) DEFAULT NULL::character varying,
    password_salt character varying(255) DEFAULT NULL::character varying,
    remember_token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    persistence_token character varying(255),
    reset_password_token character varying(255),
    perishable_token character varying(255),
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    login character varying(255) DEFAULT NULL::character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying(255),
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    api_key character varying(40)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE variants (
    id integer NOT NULL,
    product_id integer,
    sku character varying(255) DEFAULT ''::character varying NOT NULL,
    price numeric(8,2) NOT NULL,
    weight numeric(8,2),
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    count_on_hand integer DEFAULT 0 NOT NULL,
    cost_price numeric(8,2) DEFAULT NULL::numeric,
    "position" integer
);


--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variants_id_seq OWNED BY variants.id;


--
-- Name: zone_members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zone_members (
    id integer NOT NULL,
    zone_id integer,
    zoneable_id integer,
    zoneable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zone_members_id_seq OWNED BY zone_members.id;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zones (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zones_id_seq OWNED BY zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE activators ALTER COLUMN id SET DEFAULT nextval('activators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE adjustments ALTER COLUMN id SET DEFAULT nextval('adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE calculators ALTER COLUMN id SET DEFAULT nextval('calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE creditcards ALTER COLUMN id SET DEFAULT nextval('creditcards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE gateways ALTER COLUMN id SET DEFAULT nextval('gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE inventory_units ALTER COLUMN id SET DEFAULT nextval('inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE log_entries ALTER COLUMN id SET DEFAULT nextval('log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE mail_methods ALTER COLUMN id SET DEFAULT nextval('mail_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE option_types ALTER COLUMN id SET DEFAULT nextval('option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE option_values ALTER COLUMN id SET DEFAULT nextval('option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_groups ALTER COLUMN id SET DEFAULT nextval('product_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_option_types ALTER COLUMN id SET DEFAULT nextval('product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_properties ALTER COLUMN id SET DEFAULT nextval('product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_scopes ALTER COLUMN id SET DEFAULT nextval('product_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE promotion_actions ALTER COLUMN id SET DEFAULT nextval('promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE promotion_rules ALTER COLUMN id SET DEFAULT nextval('promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE prototypes ALTER COLUMN id SET DEFAULT nextval('prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE return_authorizations ALTER COLUMN id SET DEFAULT nextval('return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipments ALTER COLUMN id SET DEFAULT nextval('shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipping_categories ALTER COLUMN id SET DEFAULT nextval('shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipping_methods ALTER COLUMN id SET DEFAULT nextval('shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE state_events ALTER COLUMN id SET DEFAULT nextval('state_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tax_categories ALTER COLUMN id SET DEFAULT nextval('tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tax_rates ALTER COLUMN id SET DEFAULT nextval('tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taxonomies ALTER COLUMN id SET DEFAULT nextval('taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taxons ALTER COLUMN id SET DEFAULT nextval('taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tokenized_permissions ALTER COLUMN id SET DEFAULT nextval('tokenized_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE variants ALTER COLUMN id SET DEFAULT nextval('variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zone_members ALTER COLUMN id SET DEFAULT nextval('zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- Name: activators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activators
    ADD CONSTRAINT activators_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY adjustments
    ADD CONSTRAINT adjustments_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calculators
    ADD CONSTRAINT calculators_pkey PRIMARY KEY (id);


--
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: creditcards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY creditcards
    ADD CONSTRAINT creditcards_pkey PRIMARY KEY (id);


--
-- Name: gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gateways
    ADD CONSTRAINT gateways_pkey PRIMARY KEY (id);


--
-- Name: inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inventory_units
    ADD CONSTRAINT inventory_units_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_entries
    ADD CONSTRAINT log_entries_pkey PRIMARY KEY (id);


--
-- Name: mail_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mail_methods
    ADD CONSTRAINT mail_methods_pkey PRIMARY KEY (id);


--
-- Name: option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY option_types
    ADD CONSTRAINT option_types_pkey PRIMARY KEY (id);


--
-- Name: option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: product_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_groups
    ADD CONSTRAINT product_groups_pkey PRIMARY KEY (id);


--
-- Name: product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_option_types
    ADD CONSTRAINT product_option_types_pkey PRIMARY KEY (id);


--
-- Name: product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: product_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_scopes
    ADD CONSTRAINT product_scopes_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY promotion_action_line_items
    ADD CONSTRAINT promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY promotion_actions
    ADD CONSTRAINT promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY promotion_rules
    ADD CONSTRAINT promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prototypes
    ADD CONSTRAINT prototypes_pkey PRIMARY KEY (id);


--
-- Name: return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY return_authorizations
    ADD CONSTRAINT return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipping_categories
    ADD CONSTRAINT shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipping_methods
    ADD CONSTRAINT shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: state_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY state_events
    ADD CONSTRAINT state_events_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tax_categories
    ADD CONSTRAINT tax_categories_pkey PRIMARY KEY (id);


--
-- Name: tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxons
    ADD CONSTRAINT taxons_pkey PRIMARY KEY (id);


--
-- Name: tokenized_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tokenized_permissions
    ADD CONSTRAINT tokenized_permissions_pkey PRIMARY KEY (id);


--
-- Name: trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zone_members
    ADD CONSTRAINT zone_members_pkey PRIMARY KEY (id);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON adjustments USING btree (order_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON assets USING btree (viewable_type, type);


--
-- Name: index_configurations_on_name_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_configurations_on_name_and_type ON configurations USING btree (name, type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON inventory_units USING btree (variant_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_order_id ON line_items USING btree (order_id);


--
-- Name: index_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_variant_id ON line_items USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id ON option_values_variants USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_number ON orders USING btree (number);


--
-- Name: index_product_groups_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_groups_on_name ON product_groups USING btree (name);


--
-- Name: index_product_groups_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_groups_on_permalink ON product_groups USING btree (permalink);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON product_properties USING btree (product_id);


--
-- Name: index_product_scopes_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_scopes_on_name ON product_scopes USING btree (name);


--
-- Name: index_product_scopes_on_product_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_scopes_on_product_group_id ON product_scopes USING btree (product_group_id);


--
-- Name: index_products_on_available_on; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_available_on ON products USING btree (available_on);


--
-- Name: index_products_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_deleted_at ON products USING btree (deleted_at);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_name ON products USING btree (name);


--
-- Name: index_products_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_permalink ON products USING btree (permalink);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_taxons_on_product_id ON products_taxons USING btree (product_id);


--
-- Name: index_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_taxons_on_taxon_id ON products_taxons USING btree (taxon_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON promotion_rules_users USING btree (user_id);


--
-- Name: index_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_users_on_role_id ON roles_users USING btree (role_id);


--
-- Name: index_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_users_on_user_id ON roles_users USING btree (user_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON shipments USING btree (number);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON taxons USING btree (taxonomy_id);


--
-- Name: index_tokenized_name_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tokenized_name_and_type ON tokenized_permissions USING btree (permissable_id, permissable_type);


--
-- Name: index_users_on_persistence_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_persistence_token ON users USING btree (persistence_token);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_variants_on_product_id ON variants USING btree (product_id);


--
-- Name: ix_prefs_on_owner_attr_pref; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX ix_prefs_on_owner_attr_pref ON preferences USING btree (owner_id, owner_type, name, group_id, group_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20111109112946');

INSERT INTO schema_migrations (version) VALUES ('20111109112947');

INSERT INTO schema_migrations (version) VALUES ('20111109112948');

INSERT INTO schema_migrations (version) VALUES ('20111109112949');

INSERT INTO schema_migrations (version) VALUES ('20111109112950');

INSERT INTO schema_migrations (version) VALUES ('20111109112951');

INSERT INTO schema_migrations (version) VALUES ('20111109112952');

INSERT INTO schema_migrations (version) VALUES ('20111109112953');

INSERT INTO schema_migrations (version) VALUES ('20111109112954');

INSERT INTO schema_migrations (version) VALUES ('20111109112955');

INSERT INTO schema_migrations (version) VALUES ('20111109112956');

INSERT INTO schema_migrations (version) VALUES ('20111109112957');

INSERT INTO schema_migrations (version) VALUES ('20111109112958');

INSERT INTO schema_migrations (version) VALUES ('20111109112959');

INSERT INTO schema_migrations (version) VALUES ('20111109112960');

INSERT INTO schema_migrations (version) VALUES ('20111109112961');

INSERT INTO schema_migrations (version) VALUES ('20111109112962');

INSERT INTO schema_migrations (version) VALUES ('20111109112963');

INSERT INTO schema_migrations (version) VALUES ('20111109112964');

INSERT INTO schema_migrations (version) VALUES ('20111109112965');

INSERT INTO schema_migrations (version) VALUES ('20111109112966');

INSERT INTO schema_migrations (version) VALUES ('20111109112967');

INSERT INTO schema_migrations (version) VALUES ('20111109112968');

INSERT INTO schema_migrations (version) VALUES ('20111109112969');

INSERT INTO schema_migrations (version) VALUES ('20111109112970');

INSERT INTO schema_migrations (version) VALUES ('20111109112971');

INSERT INTO schema_migrations (version) VALUES ('20111109112972');

INSERT INTO schema_migrations (version) VALUES ('20111109112973');

INSERT INTO schema_migrations (version) VALUES ('20111109112974');

INSERT INTO schema_migrations (version) VALUES ('20111109112975');

INSERT INTO schema_migrations (version) VALUES ('20111109112976');

INSERT INTO schema_migrations (version) VALUES ('20111109112977');

INSERT INTO schema_migrations (version) VALUES ('20111109112978');

INSERT INTO schema_migrations (version) VALUES ('20111109112979');

INSERT INTO schema_migrations (version) VALUES ('20111109112980');

INSERT INTO schema_migrations (version) VALUES ('20111109112981');

INSERT INTO schema_migrations (version) VALUES ('20111109112982');

INSERT INTO schema_migrations (version) VALUES ('20111109112983');

INSERT INTO schema_migrations (version) VALUES ('20111109112984');

INSERT INTO schema_migrations (version) VALUES ('20111109112985');

INSERT INTO schema_migrations (version) VALUES ('20111109112986');

INSERT INTO schema_migrations (version) VALUES ('20111109112987');

INSERT INTO schema_migrations (version) VALUES ('20111109112988');

INSERT INTO schema_migrations (version) VALUES ('20111109112989');

INSERT INTO schema_migrations (version) VALUES ('20111109112990');

INSERT INTO schema_migrations (version) VALUES ('20111109112991');

INSERT INTO schema_migrations (version) VALUES ('20111109112992');

INSERT INTO schema_migrations (version) VALUES ('20111109112993');

INSERT INTO schema_migrations (version) VALUES ('20111109112994');

INSERT INTO schema_migrations (version) VALUES ('20111109112995');

INSERT INTO schema_migrations (version) VALUES ('20111109112996');

INSERT INTO schema_migrations (version) VALUES ('20111109112997');

INSERT INTO schema_migrations (version) VALUES ('20111109112998');

INSERT INTO schema_migrations (version) VALUES ('20111109112999');

INSERT INTO schema_migrations (version) VALUES ('20111109113000');

INSERT INTO schema_migrations (version) VALUES ('20111109113001');

INSERT INTO schema_migrations (version) VALUES ('20111109113002');

INSERT INTO schema_migrations (version) VALUES ('20111109113003');

INSERT INTO schema_migrations (version) VALUES ('20111109113004');

INSERT INTO schema_migrations (version) VALUES ('20111109113005');

INSERT INTO schema_migrations (version) VALUES ('20111109113006');

INSERT INTO schema_migrations (version) VALUES ('20111109113007');

INSERT INTO schema_migrations (version) VALUES ('20111109113008');

INSERT INTO schema_migrations (version) VALUES ('20111109113009');

INSERT INTO schema_migrations (version) VALUES ('20111109113010');

INSERT INTO schema_migrations (version) VALUES ('20111109113011');

INSERT INTO schema_migrations (version) VALUES ('20111109113012');

INSERT INTO schema_migrations (version) VALUES ('20111109113013');

INSERT INTO schema_migrations (version) VALUES ('20111109113014');

INSERT INTO schema_migrations (version) VALUES ('20111109113015');

INSERT INTO schema_migrations (version) VALUES ('20111109113016');

INSERT INTO schema_migrations (version) VALUES ('20111109113017');

INSERT INTO schema_migrations (version) VALUES ('20111109113018');

INSERT INTO schema_migrations (version) VALUES ('20111109113019');

INSERT INTO schema_migrations (version) VALUES ('20111109113020');

INSERT INTO schema_migrations (version) VALUES ('20111109113021');

INSERT INTO schema_migrations (version) VALUES ('20111109113022');

INSERT INTO schema_migrations (version) VALUES ('20111109113023');

INSERT INTO schema_migrations (version) VALUES ('20111109113024');

INSERT INTO schema_migrations (version) VALUES ('20111109113025');

INSERT INTO schema_migrations (version) VALUES ('20111109113026');

INSERT INTO schema_migrations (version) VALUES ('20111109113027');

INSERT INTO schema_migrations (version) VALUES ('20111109113028');

INSERT INTO schema_migrations (version) VALUES ('20111109113029');

INSERT INTO schema_migrations (version) VALUES ('20111109113030');

INSERT INTO schema_migrations (version) VALUES ('20111109113031');

INSERT INTO schema_migrations (version) VALUES ('20111109113032');

INSERT INTO schema_migrations (version) VALUES ('20111109113033');

INSERT INTO schema_migrations (version) VALUES ('20111109113034');

INSERT INTO schema_migrations (version) VALUES ('20111109113035');

INSERT INTO schema_migrations (version) VALUES ('20111109113036');

INSERT INTO schema_migrations (version) VALUES ('20111109113037');

INSERT INTO schema_migrations (version) VALUES ('20111109113038');

INSERT INTO schema_migrations (version) VALUES ('20111109113039');

INSERT INTO schema_migrations (version) VALUES ('20111109113040');

INSERT INTO schema_migrations (version) VALUES ('20111109113041');

INSERT INTO schema_migrations (version) VALUES ('20111109113042');

INSERT INTO schema_migrations (version) VALUES ('20111109113043');

INSERT INTO schema_migrations (version) VALUES ('20111109113044');