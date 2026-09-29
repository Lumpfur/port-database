--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2026-09-29 15:07:29

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
-- TOC entry 6 (class 2615 OID 16445)
-- Name: port_p6; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA port_p6;


--
-- TOC entry 7 (class 2615 OID 16738)
-- Name: port_p7; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA port_p7;


--
-- TOC entry 972 (class 1247 OID 16741)
-- Name: person_name_type; Type: TYPE; Schema: port_p7; Owner: -
--

CREATE TYPE port_p7.person_name_type AS (
	last_name character varying(60),
	first_name character varying(60),
	middle_name character varying(60)
);


--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 972
-- Name: TYPE person_name_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TYPE port_p7.person_name_type IS 'ФИО; обязательность частей проверяется в employee';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16498)
-- Name: berth; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.berth (
    id integer NOT NULL,
    number character varying(12) NOT NULL,
    depth numeric(5,2) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE berth; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.berth IS 'Причал';


--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN berth.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.berth.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN berth.number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.berth.number IS 'Номер';


--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN berth.depth; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.berth.depth IS 'Глубина в метрах';


--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN berth.is_active; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.berth.is_active IS 'Доступен для использования';


--
-- TOC entry 227 (class 1259 OID 16497)
-- Name: berth_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.berth ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.berth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 16614)
-- Name: cargo_operation; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.cargo_operation (
    id integer NOT NULL,
    operation_number character varying(30) NOT NULL,
    operation_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    vessel_call_id integer NOT NULL,
    operation_type character varying(12) NOT NULL,
    consignor_id integer NOT NULL,
    consignee_id integer NOT NULL
);


--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE cargo_operation; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.cargo_operation IS 'Грузовая операция';


--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.operation_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.operation_number IS 'Номер';


--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.operation_date; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.operation_date IS 'Дата начала';


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.vessel_call_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.vessel_call_id IS 'Заход';


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.operation_type; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.operation_type IS 'ПОГРУЗКА или ВЫГРУЗКА';


--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.consignor_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.consignor_id IS 'Отправитель';


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN cargo_operation.consignee_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation.consignee_id IS 'Получатель';


--
-- TOC entry 243 (class 1259 OID 16613)
-- Name: cargo_operation_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.cargo_operation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.cargo_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 16641)
-- Name: cargo_operation_item; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.cargo_operation_item (
    id integer NOT NULL,
    cargo_operation_id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) NOT NULL,
    unit_id integer NOT NULL
);


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE cargo_operation_item; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.cargo_operation_item IS 'Позиция грузовой операции';


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN cargo_operation_item.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation_item.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN cargo_operation_item.cargo_operation_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation_item.cargo_operation_id IS 'Операция';


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN cargo_operation_item.cargo_type_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation_item.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN cargo_operation_item.quantity; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation_item.quantity IS 'Количество';


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN cargo_operation_item.unit_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_operation_item.unit_id IS 'Единица измерения';


--
-- TOC entry 245 (class 1259 OID 16640)
-- Name: cargo_operation_item_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.cargo_operation_item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.cargo_operation_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16457)
-- Name: cargo_type; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.cargo_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    imo_code character varying(10),
    is_dangerous boolean DEFAULT false NOT NULL
);


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE cargo_type; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.cargo_type IS 'Тип груза';


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN cargo_type.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN cargo_type.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_type.name IS 'Наименование';


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN cargo_type.imo_code; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_type.imo_code IS 'Класс опасности ИМО';


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN cargo_type.is_dangerous; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.cargo_type.is_dangerous IS 'Опасный груз';


--
-- TOC entry 219 (class 1259 OID 16456)
-- Name: cargo_type_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.cargo_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.cargo_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16521)
-- Name: consignee; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.consignee (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    inn character varying(12),
    phone character varying(20)
);


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE consignee; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.consignee IS 'Грузополучатель';


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN consignee.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignee.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN consignee.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignee.name IS 'Наименование';


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN consignee.inn; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignee.inn IS 'ИНН резидента';


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN consignee.phone; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignee.phone IS 'Телефон';


--
-- TOC entry 233 (class 1259 OID 16520)
-- Name: consignee_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.consignee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.consignee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16513)
-- Name: consignor; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.consignor (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    inn character varying(12),
    phone character varying(20)
);


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE consignor; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.consignor IS 'Грузоотправитель';


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN consignor.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignor.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN consignor.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignor.name IS 'Наименование';


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN consignor.inn; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignor.inn IS 'ИНН резидента';


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN consignor.phone; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.consignor.phone IS 'Телефон';


--
-- TOC entry 231 (class 1259 OID 16512)
-- Name: consignor_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.consignor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.consignor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16529)
-- Name: employee; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.employee (
    id integer NOT NULL,
    full_name character varying(200) NOT NULL,
    "position" character varying(80) NOT NULL,
    employee_number character varying(20) NOT NULL,
    login character varying(50) NOT NULL,
    password_hash text NOT NULL
);


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE employee; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.employee IS 'Сотрудник';


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee.full_name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee.full_name IS 'ФИО';


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee."position"; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee."position" IS 'Должность';


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee.employee_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee.employee_number IS 'Табельный номер';


--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee.login; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee.login IS 'Логин';


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN employee.password_hash; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.employee.password_hash IS 'Хеш пароля';


--
-- TOC entry 235 (class 1259 OID 16528)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.employee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16484)
-- Name: fee_type; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.fee_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    base_rate numeric(12,2) NOT NULL,
    unit_id integer NOT NULL
);


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE fee_type; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.fee_type IS 'Вид сбора';


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN fee_type.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.fee_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN fee_type.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.fee_type.name IS 'Наименование';


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN fee_type.base_rate; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.fee_type.base_rate IS 'Базовая ставка';


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN fee_type.unit_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.fee_type.unit_id IS 'Единица начисления';


--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: fee_type_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.fee_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.fee_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16507)
-- Name: ship_owner; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.ship_owner (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    country character varying(80) NOT NULL,
    phone character varying(20)
);


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE ship_owner; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.ship_owner IS 'Судовладелец';


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN ship_owner.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.ship_owner.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN ship_owner.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.ship_owner.name IS 'Наименование';


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN ship_owner.country; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.ship_owner.country IS 'Страна';


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN ship_owner.phone; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.ship_owner.phone IS 'Телефон';


--
-- TOC entry 229 (class 1259 OID 16506)
-- Name: ship_owner_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.ship_owner ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.ship_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 16716)
-- Name: stock_balance; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.stock_balance (
    id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) DEFAULT 0 NOT NULL,
    unit_id integer NOT NULL,
    location character varying(50) NOT NULL,
    batch_number character varying(40) NOT NULL,
    last_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE stock_balance; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.stock_balance IS 'Текущий остаток';


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.cargo_type_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.quantity; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.quantity IS 'Остаток';


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.unit_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.unit_id IS 'Единица измерения';


--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.location; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.location IS 'Место хранения';


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.batch_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.batch_number IS 'Номер партии';


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN stock_balance.last_updated; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.stock_balance.last_updated IS 'Время снимка';


--
-- TOC entry 251 (class 1259 OID 16715)
-- Name: stock_balance_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.stock_balance ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.stock_balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16474)
-- Name: unit; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.unit (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    short_name character varying(12) NOT NULL
);


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE unit; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.unit IS 'Единица измерения';


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN unit.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.unit.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN unit.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.unit.name IS 'Наименование';


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN unit.short_name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.unit.short_name IS 'Обозначение';


--
-- TOC entry 223 (class 1259 OID 16473)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.unit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16541)
-- Name: vessel; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.vessel (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    call_sign character varying(12) NOT NULL,
    imo_number character varying(7) NOT NULL,
    flag character varying(80) NOT NULL,
    vessel_type_id integer NOT NULL,
    ship_owner_id integer NOT NULL,
    vessel_status_id integer NOT NULL,
    gross_tonnage numeric(12,2) NOT NULL
);


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE vessel; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.vessel IS 'Судно';


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.name IS 'Название';


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.call_sign; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.call_sign IS 'Позывной';


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.imo_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.imo_number IS 'Номер ИМО';


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.flag; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.flag IS 'Страна флага';


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.vessel_type_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.vessel_type_id IS 'Тип судна';


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.ship_owner_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.ship_owner_id IS 'Судовладелец';


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.vessel_status_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.vessel_status_id IS 'Текущий статус';


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN vessel.gross_tonnage; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel.gross_tonnage IS 'Валовая вместимость GT';


--
-- TOC entry 240 (class 1259 OID 16569)
-- Name: vessel_call; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.vessel_call (
    id integer NOT NULL,
    arrival_datetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    vessel_id integer NOT NULL,
    berth_id integer,
    purpose character varying(200) NOT NULL,
    dispatcher_id integer NOT NULL,
    departure_datetime timestamp with time zone
);


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE vessel_call; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.vessel_call IS 'Заход судна';


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.arrival_datetime; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.arrival_datetime IS 'Время прибытия';


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.vessel_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.vessel_id IS 'Судно';


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.berth_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.berth_id IS 'Причал';


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.purpose; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.purpose IS 'Цель захода';


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.dispatcher_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.dispatcher_id IS 'Диспетчер';


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN vessel_call.departure_datetime; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call.departure_datetime IS 'Время убытия';


--
-- TOC entry 239 (class 1259 OID 16568)
-- Name: vessel_call_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.vessel_call ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.vessel_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16594)
-- Name: vessel_call_service; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.vessel_call_service (
    id integer NOT NULL,
    vessel_call_id integer NOT NULL,
    fee_type_id integer NOT NULL,
    quantity numeric(12,3) DEFAULT 0 NOT NULL,
    rate numeric(12,2) NOT NULL,
    amount numeric(24,2) GENERATED ALWAYS AS (round((quantity * rate), 2)) STORED NOT NULL
);


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE vessel_call_service; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.vessel_call_service IS 'Позиция захода';


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.vessel_call_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.vessel_call_id IS 'Заход';


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.fee_type_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.fee_type_id IS 'Вид сбора';


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.quantity; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.quantity IS 'Количество';


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.rate; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.rate IS 'Историческая ставка';


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN vessel_call_service.amount; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_call_service.amount IS 'Сумма с округлением до копеек';


--
-- TOC entry 241 (class 1259 OID 16593)
-- Name: vessel_call_service_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.vessel_call_service ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.vessel_call_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 16540)
-- Name: vessel_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.vessel ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.vessel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16466)
-- Name: vessel_status; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.vessel_status (
    id integer NOT NULL,
    name character varying(60) NOT NULL
);


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE vessel_status; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.vessel_status IS 'Статус судна';


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vessel_status.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_status.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vessel_status.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_status.name IS 'Наименование';


--
-- TOC entry 221 (class 1259 OID 16465)
-- Name: vessel_status_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.vessel_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.vessel_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16447)
-- Name: vessel_type; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.vessel_type (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text
);


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE vessel_type; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.vessel_type IS 'Тип судна';


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN vessel_type.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN vessel_type.name; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_type.name IS 'Наименование';


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN vessel_type.description; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.vessel_type.description IS 'Описание';


--
-- TOC entry 217 (class 1259 OID 16446)
-- Name: vessel_type_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.vessel_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.vessel_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 16665)
-- Name: warehouse_order; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.warehouse_order (
    id integer NOT NULL,
    order_number character varying(30) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    order_type character varying(10) NOT NULL,
    consignor_id integer,
    consignee_id integer,
    responsible_emp_id integer NOT NULL
);


--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE warehouse_order; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.warehouse_order IS 'Складской ордер';


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.order_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.order_number IS 'Номер';


--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.created_at; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.created_at IS 'Дата создания';


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.order_type; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.order_type IS 'ПРИХОД РАСХОД ВОЗВРАТ';


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.consignor_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.consignor_id IS 'Контрагент отправитель';


--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.consignee_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.consignee_id IS 'Контрагент получатель';


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN warehouse_order.responsible_emp_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order.responsible_emp_id IS 'Ответственный';


--
-- TOC entry 247 (class 1259 OID 16664)
-- Name: warehouse_order_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.warehouse_order ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.warehouse_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 16692)
-- Name: warehouse_order_item; Type: TABLE; Schema: port_p6; Owner: -
--

CREATE TABLE port_p6.warehouse_order_item (
    id integer NOT NULL,
    warehouse_order_id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) NOT NULL,
    unit_id integer NOT NULL,
    location character varying(50) NOT NULL,
    batch_number character varying(40) NOT NULL
);


--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE warehouse_order_item; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON TABLE port_p6.warehouse_order_item IS 'Позиция складского ордера';


--
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.warehouse_order_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.warehouse_order_id IS 'Ордер';


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.cargo_type_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.quantity; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.quantity IS 'Количество';


--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.unit_id; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.unit_id IS 'Единица измерения';


--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.location; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.location IS 'Место хранения';


--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN warehouse_order_item.batch_number; Type: COMMENT; Schema: port_p6; Owner: -
--

COMMENT ON COLUMN port_p6.warehouse_order_item.batch_number IS 'Номер партии';


--
-- TOC entry 249 (class 1259 OID 16691)
-- Name: warehouse_order_item_id_seq; Type: SEQUENCE; Schema: port_p6; Owner: -
--

ALTER TABLE port_p6.warehouse_order_item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p6.warehouse_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 16802)
-- Name: berth; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.berth (
    id integer NOT NULL,
    number character varying(12) NOT NULL,
    depth numeric(5,2) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_berth_1 CHECK ((depth > (0)::numeric)),
    CONSTRAINT ck_berth_2 CHECK ((btrim((number)::text) <> ''::text))
);


--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE berth; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.berth IS 'Причал';


--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN berth.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.berth.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN berth.number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.berth.number IS 'Номер';


--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN berth.depth; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.berth.depth IS 'Глубина в метрах';


--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN berth.is_active; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.berth.is_active IS 'Доступен для использования';


--
-- TOC entry 264 (class 1259 OID 16801)
-- Name: berth_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.berth ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.berth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 16943)
-- Name: cargo_operation; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.cargo_operation (
    id integer NOT NULL,
    operation_number character varying(30) NOT NULL,
    operation_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    vessel_call_id integer NOT NULL,
    operation_type character varying(12) NOT NULL,
    consignor_id integer NOT NULL,
    consignee_id integer NOT NULL,
    CONSTRAINT ck_cargo_operation_1 CHECK ((btrim((operation_number)::text) <> ''::text)),
    CONSTRAINT ck_cargo_operation_2 CHECK (((operation_type)::text = ANY ((ARRAY['ПОГРУЗКА'::character varying, 'ВЫГРУЗКА'::character varying])::text[])))
);


--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE cargo_operation; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.cargo_operation IS 'Грузовая операция';


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.operation_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.operation_number IS 'Номер';


--
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.operation_date; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.operation_date IS 'Дата начала';


--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.vessel_call_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.vessel_call_id IS 'Заход';


--
-- TOC entry 5529 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.operation_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.operation_type IS 'ПОГРУЗКА или ВЫГРУЗКА';


--
-- TOC entry 5530 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.consignor_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.consignor_id IS 'Отправитель';


--
-- TOC entry 5531 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN cargo_operation.consignee_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation.consignee_id IS 'Получатель';


--
-- TOC entry 280 (class 1259 OID 16942)
-- Name: cargo_operation_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.cargo_operation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.cargo_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 16972)
-- Name: cargo_operation_item; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.cargo_operation_item (
    id integer NOT NULL,
    cargo_operation_id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) NOT NULL,
    unit_id integer NOT NULL,
    CONSTRAINT ck_cargo_operation_item_1 CHECK ((quantity > (0)::numeric))
);


--
-- TOC entry 5532 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE cargo_operation_item; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.cargo_operation_item IS 'Позиция грузовой операции';


--
-- TOC entry 5533 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN cargo_operation_item.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation_item.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5534 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN cargo_operation_item.cargo_operation_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation_item.cargo_operation_id IS 'Операция';


--
-- TOC entry 5535 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN cargo_operation_item.cargo_type_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation_item.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5536 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN cargo_operation_item.quantity; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation_item.quantity IS 'Количество';


--
-- TOC entry 5537 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN cargo_operation_item.unit_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_operation_item.unit_id IS 'Единица измерения';


--
-- TOC entry 282 (class 1259 OID 16971)
-- Name: cargo_operation_item_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.cargo_operation_item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.cargo_operation_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 16754)
-- Name: cargo_type; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.cargo_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    imo_code character varying(10),
    is_dangerous boolean DEFAULT false NOT NULL,
    CONSTRAINT ck_cargo_type_1 CHECK ((char_length(btrim((name)::text)) > 2)),
    CONSTRAINT ck_cargo_type_2 CHECK (((is_dangerous AND (imo_code IS NOT NULL) AND (btrim((imo_code)::text) <> ''::text)) OR ((NOT is_dangerous) AND (imo_code IS NULL))))
);


--
-- TOC entry 5538 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE cargo_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.cargo_type IS 'Тип груза';


--
-- TOC entry 5539 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN cargo_type.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5540 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN cargo_type.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_type.name IS 'Наименование';


--
-- TOC entry 5541 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN cargo_type.imo_code; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_type.imo_code IS 'Класс опасности ИМО';


--
-- TOC entry 5542 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN cargo_type.is_dangerous; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.cargo_type.is_dangerous IS 'Опасный груз';


--
-- TOC entry 256 (class 1259 OID 16753)
-- Name: cargo_type_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.cargo_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.cargo_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 16833)
-- Name: consignee; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.consignee (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    inn character varying(12),
    phone character varying(20),
    CONSTRAINT ck_consignee_1 CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT ck_consignee_2 CHECK (((inn IS NULL) OR ((inn)::text ~ '^([0-9]{10}|[0-9]{12})$'::text))),
    CONSTRAINT ck_consignee_3 CHECK (((phone IS NULL) OR ((phone)::text ~ '^\+[0-9]{7,15}$'::text)))
);


--
-- TOC entry 5543 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE consignee; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.consignee IS 'Грузополучатель';


--
-- TOC entry 5544 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN consignee.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignee.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5545 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN consignee.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignee.name IS 'Наименование';


--
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN consignee.inn; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignee.inn IS 'ИНН резидента';


--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN consignee.phone; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignee.phone IS 'Телефон';


--
-- TOC entry 270 (class 1259 OID 16832)
-- Name: consignee_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.consignee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.consignee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 269 (class 1259 OID 16822)
-- Name: consignor; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.consignor (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    inn character varying(12),
    phone character varying(20),
    CONSTRAINT ck_consignor_1 CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT ck_consignor_2 CHECK (((inn IS NULL) OR ((inn)::text ~ '^([0-9]{10}|[0-9]{12})$'::text))),
    CONSTRAINT ck_consignor_3 CHECK (((phone IS NULL) OR ((phone)::text ~ '^\+[0-9]{7,15}$'::text)))
);


--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE consignor; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.consignor IS 'Грузоотправитель';


--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN consignor.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignor.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN consignor.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignor.name IS 'Наименование';


--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN consignor.inn; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignor.inn IS 'ИНН резидента';


--
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN consignor.phone; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.consignor.phone IS 'Телефон';


--
-- TOC entry 268 (class 1259 OID 16821)
-- Name: consignor_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.consignor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.consignor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 16844)
-- Name: employee; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.employee (
    id integer NOT NULL,
    full_name port_p7.person_name_type NOT NULL,
    "position" character varying(80) NOT NULL,
    employee_number character varying(20) NOT NULL,
    login character varying(50) NOT NULL,
    password_hash text NOT NULL,
    CONSTRAINT ck_employee_1 CHECK ((btrim(("position")::text) <> ''::text)),
    CONSTRAINT ck_employee_2 CHECK ((btrim((employee_number)::text) <> ''::text)),
    CONSTRAINT ck_employee_3 CHECK (((login)::text ~ '^[a-z][a-z0-9_]{2,49}$'::text)),
    CONSTRAINT ck_employee_4 CHECK ((char_length(password_hash) >= 40)),
    CONSTRAINT ck_employee_name CHECK ((((full_name).last_name IS NOT NULL) AND ((full_name).first_name IS NOT NULL) AND (btrim(((full_name).last_name)::text) <> ''::text) AND (btrim(((full_name).first_name)::text) <> ''::text) AND (((full_name).middle_name IS NULL) OR (btrim(((full_name).middle_name)::text) <> ''::text))))
);


--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE employee; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.employee IS 'Сотрудник';


--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee.full_name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee.full_name IS 'ФИО';


--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee."position"; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee."position" IS 'Должность';


--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee.employee_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee.employee_number IS 'Табельный номер';


--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee.login; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee.login IS 'Логин';


--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN employee.password_hash; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.employee.password_hash IS 'Хеш пароля';


--
-- TOC entry 272 (class 1259 OID 16843)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.employee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 263 (class 1259 OID 16786)
-- Name: fee_type; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.fee_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    base_rate numeric(12,2) NOT NULL,
    unit_id integer NOT NULL,
    CONSTRAINT ck_fee_type_1 CHECK ((base_rate >= (0)::numeric)),
    CONSTRAINT ck_fee_type_2 CHECK ((btrim((name)::text) <> ''::text))
);


--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE fee_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.fee_type IS 'Вид сбора';


--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN fee_type.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.fee_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN fee_type.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.fee_type.name IS 'Наименование';


--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN fee_type.base_rate; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.fee_type.base_rate IS 'Базовая ставка';


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN fee_type.unit_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.fee_type.unit_id IS 'Единица начисления';


--
-- TOC entry 262 (class 1259 OID 16785)
-- Name: fee_type_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.fee_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.fee_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 291 (class 1259 OID 17082)
-- Name: port_department; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.port_department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    parent_id integer,
    CONSTRAINT port_department_check CHECK (((parent_id IS NULL) OR (parent_id <> id))),
    CONSTRAINT port_department_name_check CHECK ((btrim((name)::text) <> ''::text))
);


--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE port_department; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.port_department IS 'Иерархия подразделений для РБД 2 и 3';


--
-- TOC entry 290 (class 1259 OID 17081)
-- Name: port_department_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.port_department ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.port_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 16813)
-- Name: ship_owner; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.ship_owner (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    country character varying(80) NOT NULL,
    phone character varying(20),
    CONSTRAINT ck_ship_owner_1 CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT ck_ship_owner_2 CHECK ((btrim((country)::text) <> ''::text)),
    CONSTRAINT ck_ship_owner_3 CHECK (((phone IS NULL) OR ((phone)::text ~ '^\+[0-9]{7,15}$'::text)))
);


--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE ship_owner; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.ship_owner IS 'Судовладелец';


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN ship_owner.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.ship_owner.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN ship_owner.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.ship_owner.name IS 'Наименование';


--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN ship_owner.country; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.ship_owner.country IS 'Страна';


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN ship_owner.phone; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.ship_owner.phone IS 'Телефон';


--
-- TOC entry 266 (class 1259 OID 16812)
-- Name: ship_owner_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.ship_owner ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.ship_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 289 (class 1259 OID 17054)
-- Name: stock_balance; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.stock_balance (
    id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) DEFAULT 0 NOT NULL,
    unit_id integer NOT NULL,
    location character varying(50) NOT NULL,
    batch_number character varying(40) NOT NULL,
    last_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_stock_balance_1 CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT ck_stock_balance_2 CHECK ((btrim((location)::text) <> ''::text)),
    CONSTRAINT ck_stock_balance_3 CHECK ((btrim((batch_number)::text) <> ''::text))
);


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE stock_balance; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.stock_balance IS 'Текущий остаток';


--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.cargo_type_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.quantity; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.quantity IS 'Остаток';


--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.unit_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.unit_id IS 'Единица измерения';


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.location; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.location IS 'Место хранения';


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.batch_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.batch_number IS 'Номер партии';


--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN stock_balance.last_updated; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.stock_balance.last_updated IS 'Время снимка';


--
-- TOC entry 288 (class 1259 OID 17053)
-- Name: stock_balance_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.stock_balance ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.stock_balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 16774)
-- Name: unit; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.unit (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    short_name character varying(12) NOT NULL,
    CONSTRAINT ck_unit_1 CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT ck_unit_2 CHECK ((btrim((short_name)::text) <> ''::text))
);


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE unit; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.unit IS 'Единица измерения';


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN unit.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.unit.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN unit.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.unit.name IS 'Наименование';


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN unit.short_name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.unit.short_name IS 'Обозначение';


--
-- TOC entry 260 (class 1259 OID 16773)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.unit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 17098)
-- Name: user_logs; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.user_logs (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    occurred_at timestamp with time zone NOT NULL,
    event_data jsonb NOT NULL,
    CONSTRAINT user_logs_event_data_check CHECK ((jsonb_typeof(event_data) = 'object'::text))
);


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE user_logs; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.user_logs IS 'Учебный журнал действий сотрудников для РБД 3';


--
-- TOC entry 292 (class 1259 OID 17097)
-- Name: user_logs_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.user_logs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.user_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 275 (class 1259 OID 16861)
-- Name: vessel; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.vessel (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    call_sign character varying(12) NOT NULL,
    imo_number character varying(7) NOT NULL,
    flag character varying(80) NOT NULL,
    vessel_type_id integer NOT NULL,
    ship_owner_id integer NOT NULL,
    vessel_status_id integer NOT NULL,
    gross_tonnage numeric(12,2) NOT NULL,
    CONSTRAINT ck_vessel_1 CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT ck_vessel_2 CHECK ((btrim((call_sign)::text) <> ''::text)),
    CONSTRAINT ck_vessel_3 CHECK ((btrim((flag)::text) <> ''::text)),
    CONSTRAINT ck_vessel_4 CHECK (((imo_number)::text ~ '^[0-9]{7}$'::text)),
    CONSTRAINT ck_vessel_5 CHECK ((gross_tonnage > (0)::numeric))
);


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE vessel; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.vessel IS 'Судно';


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.name IS 'Название';


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.call_sign; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.call_sign IS 'Позывной';


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.imo_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.imo_number IS 'Номер ИМО';


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.flag; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.flag IS 'Страна флага';


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.vessel_type_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.vessel_type_id IS 'Тип судна';


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.ship_owner_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.ship_owner_id IS 'Судовладелец';


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.vessel_status_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.vessel_status_id IS 'Текущий статус';


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN vessel.gross_tonnage; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel.gross_tonnage IS 'Валовая вместимость GT';


--
-- TOC entry 277 (class 1259 OID 16894)
-- Name: vessel_call; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.vessel_call (
    id integer NOT NULL,
    arrival_datetime timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    vessel_id integer NOT NULL,
    berth_id integer,
    purpose character varying(200) NOT NULL,
    dispatcher_id integer NOT NULL,
    departure_datetime timestamp with time zone,
    CONSTRAINT ck_vessel_call_1 CHECK ((btrim((purpose)::text) <> ''::text)),
    CONSTRAINT ck_vessel_call_2 CHECK (((departure_datetime IS NULL) OR (departure_datetime > arrival_datetime)))
);


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE vessel_call; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.vessel_call IS 'Заход судна';


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.arrival_datetime; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.arrival_datetime IS 'Время прибытия';


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.vessel_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.vessel_id IS 'Судно';


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.berth_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.berth_id IS 'Причал';


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.purpose; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.purpose IS 'Цель захода';


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.dispatcher_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.dispatcher_id IS 'Диспетчер';


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN vessel_call.departure_datetime; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call.departure_datetime IS 'Время убытия';


--
-- TOC entry 276 (class 1259 OID 16893)
-- Name: vessel_call_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.vessel_call ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.vessel_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 16921)
-- Name: vessel_call_service; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.vessel_call_service (
    id integer NOT NULL,
    vessel_call_id integer NOT NULL,
    fee_type_id integer NOT NULL,
    quantity numeric(12,3) DEFAULT 0 NOT NULL,
    rate numeric(12,2) NOT NULL,
    amount numeric(24,2) GENERATED ALWAYS AS (round((quantity * rate), 2)) STORED NOT NULL,
    CONSTRAINT ck_vessel_call_service_1 CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT ck_vessel_call_service_2 CHECK ((rate >= (0)::numeric))
);


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE vessel_call_service; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.vessel_call_service IS 'Позиция захода';


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.vessel_call_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.vessel_call_id IS 'Заход';


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.fee_type_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.fee_type_id IS 'Вид сбора';


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.quantity; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.quantity IS 'Количество';


--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.rate; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.rate IS 'Историческая ставка';


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN vessel_call_service.amount; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_call_service.amount IS 'Сумма с округлением до копеек';


--
-- TOC entry 278 (class 1259 OID 16920)
-- Name: vessel_call_service_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.vessel_call_service ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.vessel_call_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 274 (class 1259 OID 16860)
-- Name: vessel_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.vessel ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.vessel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 16765)
-- Name: vessel_status; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.vessel_status (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    CONSTRAINT ck_vessel_status_1 CHECK ((btrim((name)::text) <> ''::text))
);


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE vessel_status; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.vessel_status IS 'Статус судна';


--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN vessel_status.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_status.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN vessel_status.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_status.name IS 'Наименование';


--
-- TOC entry 258 (class 1259 OID 16764)
-- Name: vessel_status_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.vessel_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.vessel_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 16743)
-- Name: vessel_type; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.vessel_type (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    CONSTRAINT ck_vessel_type_1 CHECK ((char_length(btrim((name)::text)) > 2))
);


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE vessel_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.vessel_type IS 'Тип судна';


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN vessel_type.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_type.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN vessel_type.name; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_type.name IS 'Наименование';


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN vessel_type.description; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.vessel_type.description IS 'Описание';


--
-- TOC entry 254 (class 1259 OID 16742)
-- Name: vessel_type_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.vessel_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.vessel_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 285 (class 1259 OID 16997)
-- Name: warehouse_order; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.warehouse_order (
    id integer NOT NULL,
    order_number character varying(30) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    order_type character varying(10) NOT NULL,
    consignor_id integer,
    consignee_id integer,
    responsible_emp_id integer NOT NULL,
    CONSTRAINT ck_warehouse_order_1 CHECK ((btrim((order_number)::text) <> ''::text)),
    CONSTRAINT ck_warehouse_order_2 CHECK (((order_type)::text = ANY ((ARRAY['ПРИХОД'::character varying, 'РАСХОД'::character varying, 'ВОЗВРАТ'::character varying])::text[]))),
    CONSTRAINT ck_warehouse_order_3 CHECK (((((consignor_id IS NOT NULL))::integer + ((consignee_id IS NOT NULL))::integer) = 1))
);


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE warehouse_order; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.warehouse_order IS 'Складской ордер';


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.order_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.order_number IS 'Номер';


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.created_at; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.created_at IS 'Дата создания';


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.order_type; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.order_type IS 'ПРИХОД РАСХОД ВОЗВРАТ';


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.consignor_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.consignor_id IS 'Контрагент отправитель';


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.consignee_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.consignee_id IS 'Контрагент получатель';


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN warehouse_order.responsible_emp_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order.responsible_emp_id IS 'Ответственный';


--
-- TOC entry 284 (class 1259 OID 16996)
-- Name: warehouse_order_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.warehouse_order ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.warehouse_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 17027)
-- Name: warehouse_order_item; Type: TABLE; Schema: port_p7; Owner: -
--

CREATE TABLE port_p7.warehouse_order_item (
    id integer NOT NULL,
    warehouse_order_id integer NOT NULL,
    cargo_type_id integer NOT NULL,
    quantity numeric(14,3) NOT NULL,
    unit_id integer NOT NULL,
    location character varying(50) NOT NULL,
    batch_number character varying(40) NOT NULL,
    CONSTRAINT ck_warehouse_order_item_1 CHECK ((quantity > (0)::numeric)),
    CONSTRAINT ck_warehouse_order_item_2 CHECK ((btrim((location)::text) <> ''::text)),
    CONSTRAINT ck_warehouse_order_item_3 CHECK ((btrim((batch_number)::text) <> ''::text))
);


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE warehouse_order_item; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON TABLE port_p7.warehouse_order_item IS 'Позиция складского ордера';


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.id IS 'Суррогатный первичный ключ';


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.warehouse_order_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.warehouse_order_id IS 'Ордер';


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.cargo_type_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.cargo_type_id IS 'Тип груза';


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.quantity; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.quantity IS 'Количество';


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.unit_id; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.unit_id IS 'Единица измерения';


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.location; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.location IS 'Место хранения';


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN warehouse_order_item.batch_number; Type: COMMENT; Schema: port_p7; Owner: -
--

COMMENT ON COLUMN port_p7.warehouse_order_item.batch_number IS 'Номер партии';


--
-- TOC entry 286 (class 1259 OID 17026)
-- Name: warehouse_order_item_id_seq; Type: SEQUENCE; Schema: port_p7; Owner: -
--

ALTER TABLE port_p7.warehouse_order_item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME port_p7.warehouse_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5337 (class 0 OID 16498)
-- Dependencies: 228
-- Data for Name: berth; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5353 (class 0 OID 16614)
-- Dependencies: 244
-- Data for Name: cargo_operation; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5355 (class 0 OID 16641)
-- Dependencies: 246
-- Data for Name: cargo_operation_item; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5329 (class 0 OID 16457)
-- Dependencies: 220
-- Data for Name: cargo_type; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5343 (class 0 OID 16521)
-- Dependencies: 234
-- Data for Name: consignee; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5341 (class 0 OID 16513)
-- Dependencies: 232
-- Data for Name: consignor; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5345 (class 0 OID 16529)
-- Dependencies: 236
-- Data for Name: employee; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5335 (class 0 OID 16484)
-- Dependencies: 226
-- Data for Name: fee_type; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5339 (class 0 OID 16507)
-- Dependencies: 230
-- Data for Name: ship_owner; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5361 (class 0 OID 16716)
-- Dependencies: 252
-- Data for Name: stock_balance; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5333 (class 0 OID 16474)
-- Dependencies: 224
-- Data for Name: unit; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5347 (class 0 OID 16541)
-- Dependencies: 238
-- Data for Name: vessel; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5349 (class 0 OID 16569)
-- Dependencies: 240
-- Data for Name: vessel_call; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5351 (class 0 OID 16594)
-- Dependencies: 242
-- Data for Name: vessel_call_service; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5331 (class 0 OID 16466)
-- Dependencies: 222
-- Data for Name: vessel_status; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5327 (class 0 OID 16447)
-- Dependencies: 218
-- Data for Name: vessel_type; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5357 (class 0 OID 16665)
-- Dependencies: 248
-- Data for Name: warehouse_order; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5359 (class 0 OID 16692)
-- Dependencies: 250
-- Data for Name: warehouse_order_item; Type: TABLE DATA; Schema: port_p6; Owner: -
--



--
-- TOC entry 5373 (class 0 OID 16802)
-- Dependencies: 265
-- Data for Name: berth; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (1, 'П-01', 8.50, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (2, 'П-02', 9.00, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (3, 'П-03', 9.50, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (4, 'П-04', 10.00, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (5, 'П-05', 10.50, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (6, 'П-06', 11.00, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (7, 'П-07', 11.50, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (8, 'П-08', 12.00, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (9, 'П-09', 12.50, true);
INSERT INTO port_p7.berth OVERRIDING SYSTEM VALUE VALUES (10, 'П-10', 13.00, true);


--
-- TOC entry 5389 (class 0 OID 16943)
-- Dependencies: 281
-- Data for Name: cargo_operation; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (1, 'GO-2026-001', '2026-09-01 10:00:00+03', 1, 'ВЫГРУЗКА', 1, 1);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (2, 'GO-2026-002', '2026-09-02 10:00:00+03', 2, 'ВЫГРУЗКА', 2, 2);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (3, 'GO-2026-003', '2026-09-03 10:00:00+03', 3, 'ВЫГРУЗКА', 3, 3);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (4, 'GO-2026-004', '2026-09-04 10:00:00+03', 4, 'ВЫГРУЗКА', 4, 4);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (5, 'GO-2026-005', '2026-09-05 10:00:00+03', 5, 'ВЫГРУЗКА', 5, 5);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (6, 'GO-2026-006', '2026-09-06 10:00:00+03', 6, 'ВЫГРУЗКА', 6, 6);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (7, 'GO-2026-007', '2026-09-07 10:00:00+03', 7, 'ВЫГРУЗКА', 7, 7);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (8, 'GO-2026-008', '2026-09-08 10:00:00+03', 8, 'ВЫГРУЗКА', 8, 8);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (9, 'GO-2026-009', '2026-09-09 10:00:00+03', 9, 'ВЫГРУЗКА', 9, 9);
INSERT INTO port_p7.cargo_operation OVERRIDING SYSTEM VALUE VALUES (10, 'GO-2026-010', '2026-09-10 10:00:00+03', 10, 'ВЫГРУЗКА', 10, 10);


--
-- TOC entry 5391 (class 0 OID 16972)
-- Dependencies: 283
-- Data for Name: cargo_operation_item; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 100.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, 110.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 120.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (4, 4, 4, 130.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (5, 5, 5, 140.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (6, 6, 6, 150.000, 4);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (7, 7, 7, 160.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (8, 8, 8, 170.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (9, 9, 9, 180.000, 1);
INSERT INTO port_p7.cargo_operation_item OVERRIDING SYSTEM VALUE VALUES (10, 10, 10, 190.000, 1);


--
-- TOC entry 5365 (class 0 OID 16754)
-- Dependencies: 257
-- Data for Name: cargo_type; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (1, 'Зерно', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (2, 'Уголь', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (3, 'Руда', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (4, 'Пиломатериалы', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (5, 'Стальной прокат', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (6, 'Контейнерный груз', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (7, 'Удобрения', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (8, 'Щебень', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (9, 'Цемент', NULL, false);
INSERT INTO port_p7.cargo_type OVERRIDING SYSTEM VALUE VALUES (10, 'Нефтепродукты', '3', true);


--
-- TOC entry 5379 (class 0 OID 16833)
-- Dependencies: 271
-- Data for Name: consignee; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (1, 'ООО «Получатель 01»', '7700000201', '+74952000001');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (2, 'ООО «Получатель 02»', '7700000202', '+74952000002');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (3, 'ООО «Получатель 03»', '7700000203', '+74952000003');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (4, 'ООО «Получатель 04»', '7700000204', '+74952000004');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (5, 'ООО «Получатель 05»', '7700000205', '+74952000005');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (6, 'ООО «Получатель 06»', '7700000206', '+74952000006');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (7, 'ООО «Получатель 07»', '7700000207', '+74952000007');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (8, 'ООО «Получатель 08»', '7700000208', '+74952000008');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (9, 'ООО «Получатель 09»', '7700000209', '+74952000009');
INSERT INTO port_p7.consignee OVERRIDING SYSTEM VALUE VALUES (10, 'ООО «Получатель 10»', '7700000210', '+74952000010');


--
-- TOC entry 5377 (class 0 OID 16822)
-- Dependencies: 269
-- Data for Name: consignor; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (1, 'ООО «Отправитель 01»', '7700000101', '+74952000001');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (2, 'ООО «Отправитель 02»', '7700000102', '+74952000002');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (3, 'ООО «Отправитель 03»', '7700000103', '+74952000003');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (4, 'ООО «Отправитель 04»', '7700000104', '+74952000004');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (5, 'ООО «Отправитель 05»', '7700000105', '+74952000005');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (6, 'ООО «Отправитель 06»', '7700000106', '+74952000006');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (7, 'ООО «Отправитель 07»', '7700000107', '+74952000007');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (8, 'ООО «Отправитель 08»', '7700000108', '+74952000008');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (9, 'ООО «Отправитель 09»', '7700000109', '+74952000009');
INSERT INTO port_p7.consignor OVERRIDING SYSTEM VALUE VALUES (10, 'ООО «Отправитель 10»', '7700000110', '+74952000010');


--
-- TOC entry 5381 (class 0 OID 16844)
-- Dependencies: 273
-- Data for Name: employee; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (1, '(Иванов,Алексей,Сергеевич)', 'Диспетчер', 'EMP-001', 'port_user_01', '!DISABLED_DEMO_ACCOUNT_5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (2, '(Петрова,Мария,Игоревна)', 'Диспетчер', 'EMP-002', 'port_user_02', '!DISABLED_DEMO_ACCOUNT_6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (3, '(Смирнов,Дмитрий,Олегович)', 'Диспетчер', 'EMP-003', 'port_user_03', '!DISABLED_DEMO_ACCOUNT_d4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (4, '(Кузнецова,Анна,Павловна)', 'Диспетчер', 'EMP-004', 'port_user_04', '!DISABLED_DEMO_ACCOUNT_4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (5, '(Попов,Илья,Андреевич)', 'Диспетчер', 'EMP-005', 'port_user_05', '!DISABLED_DEMO_ACCOUNT_4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (6, '(Соколов,Михаил,Иванович)', 'Кладовщик', 'EMP-006', 'port_user_06', '!DISABLED_DEMO_ACCOUNT_ef2d127de37b942baad06145e54b0c619a1f22327b2ebbcfbec78f5564afe39d');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (7, '(Лебедева,Елена,Викторовна)', 'Кладовщик', 'EMP-007', 'port_user_07', '!DISABLED_DEMO_ACCOUNT_e7f6c011776e8db7cd330b54174fd76f7d0216b612387a5ffcfb81e6f0919683');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (8, '(Новиков,Павел,)', 'Кладовщик', 'EMP-008', 'port_user_08', '!DISABLED_DEMO_ACCOUNT_7902699be42c8a8e46fbbb4501726517e86b22c56a189f7625a6da49081b2451');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (9, '(Морозова,Ольга,Алексеевна)', 'Кладовщик', 'EMP-009', 'port_user_09', '!DISABLED_DEMO_ACCOUNT_2c624232cdd221771294dfbb310aca000a0df6ac8b66b696d90ef06fdefb64a3');
INSERT INTO port_p7.employee OVERRIDING SYSTEM VALUE VALUES (10, '(Волков,Сергей,Николаевич)', 'Кладовщик', 'EMP-010', 'port_user_10', '!DISABLED_DEMO_ACCOUNT_19581e27de7ced00ff1ce50b2047e7a567c76b1cbaebabe5ef03f7c3017bb5b7');


--
-- TOC entry 5371 (class 0 OID 16786)
-- Dependencies: 263
-- Data for Name: fee_type; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (1, 'Корабельный сбор', 10.00, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (2, 'Канальный сбор', 12.50, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (3, 'Лоцманский сбор', 15.00, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (4, 'Маячный сбор', 17.50, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (5, 'Навигационный сбор', 20.00, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (6, 'Экологический сбор', 22.50, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (7, 'Причальный сбор', 25.00, 10);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (8, 'Буксирное сопровождение', 27.50, 9);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (9, 'Швартовные работы', 30.00, 9);
INSERT INTO port_p7.fee_type OVERRIDING SYSTEM VALUE VALUES (10, 'Обеспечение безопасности', 32.50, 9);


--
-- TOC entry 5399 (class 0 OID 17082)
-- Dependencies: 291
-- Data for Name: port_department; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (1, 'Морской терминал', NULL);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (2, 'Портовые операции', 1);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (3, 'Складская служба', 1);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (4, 'Администрация', 1);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (5, 'Причальная служба', 2);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (6, 'Диспетчерская', 2);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (7, 'Контейнерная площадка', 3);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (8, 'Склад навалочных грузов', 3);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (9, 'Отдел кадров', 4);
INSERT INTO port_p7.port_department OVERRIDING SYSTEM VALUE VALUES (10, 'Бухгалтерия', 4);


--
-- TOC entry 5375 (class 0 OID 16813)
-- Dependencies: 267
-- Data for Name: ship_owner; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (1, 'ООО «Северный флот»', 'Россия', '+74951000001');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (2, 'ООО «Балтийский перевозчик»', 'Россия', '+74951000002');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (3, 'ООО «Морской путь»', 'Россия', '+74951000003');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (4, 'ООО «Восточная линия»', 'Россия', '+74951000004');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (5, 'ООО «Арктик Транс»', 'Россия', '+74951000005');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (6, 'ООО «Каспийская линия»', 'Россия', '+74951000006');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (7, 'ООО «Океан Карго»', 'Россия', '+74951000007');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (8, 'ООО «Приморский флот»', 'Россия', '+74951000008');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (9, 'ООО «Азов Шиппинг»', 'Россия', '+74951000009');
INSERT INTO port_p7.ship_owner OVERRIDING SYSTEM VALUE VALUES (10, 'ООО «Полярная звезда»', 'Россия', '+74951000010');


--
-- TOC entry 5397 (class 0 OID 17054)
-- Dependencies: 289
-- Data for Name: stock_balance; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (1, 1, 80.000, 1, 'СКЛ-1/А-01', 'BATCH-2026-001', '2026-09-01 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (2, 2, 90.000, 1, 'СКЛ-1/А-02', 'BATCH-2026-002', '2026-09-02 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (3, 3, 100.000, 1, 'СКЛ-1/А-03', 'BATCH-2026-003', '2026-09-03 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (4, 4, 110.000, 1, 'СКЛ-1/А-04', 'BATCH-2026-004', '2026-09-04 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (5, 5, 120.000, 1, 'СКЛ-1/А-05', 'BATCH-2026-005', '2026-09-05 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (6, 6, 130.000, 4, 'СКЛ-1/А-06', 'BATCH-2026-006', '2026-09-06 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (7, 7, 140.000, 1, 'СКЛ-1/А-07', 'BATCH-2026-007', '2026-09-07 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (8, 8, 150.000, 1, 'СКЛ-1/А-08', 'BATCH-2026-008', '2026-09-08 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (9, 9, 160.000, 1, 'СКЛ-1/А-09', 'BATCH-2026-009', '2026-09-09 18:00:00+03');
INSERT INTO port_p7.stock_balance OVERRIDING SYSTEM VALUE VALUES (10, 10, 170.000, 1, 'СКЛ-1/А-10', 'BATCH-2026-010', '2026-09-10 18:00:00+03');


--
-- TOC entry 5369 (class 0 OID 16774)
-- Dependencies: 261
-- Data for Name: unit; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (1, 'Тонна', 'т');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (2, 'Килограмм', 'кг');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (3, 'Штука', 'шт');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (4, 'Контейнер TEU', 'TEU');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (5, 'Час', 'ч');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (6, 'Сутки', 'сут');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (7, 'Кубический метр', 'м3');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (8, 'Метр', 'м');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (9, 'Судозаход', 'заход');
INSERT INTO port_p7.unit OVERRIDING SYSTEM VALUE VALUES (10, 'Единица GT', 'GT');


--
-- TOC entry 5401 (class 0 OID 17098)
-- Dependencies: 293
-- Data for Name: user_logs; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (1, 1, '2026-09-15 09:00:00+03', '{"os": "Windows", "event": "login", "source": "web", "browser": "Firefox", "success": true, "actions_count": 1}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (2, 2, '2026-09-15 10:00:00+03', '{"os": "Windows", "event": "create_order", "source": "web", "browser": "Chrome", "success": true, "actions_count": 2}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (4, 4, '2026-09-15 12:00:00+03', '{"os": "Windows", "event": "create_order", "source": "web", "browser": "Chrome", "success": true, "actions_count": 4}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (5, 5, '2026-09-15 13:00:00+03', '{"os": "Windows", "event": "login", "source": "web", "browser": "Firefox", "success": true, "actions_count": 5}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (7, 7, '2026-09-15 15:00:00+03', '{"os": "Windows", "event": "login", "source": "web", "browser": "Firefox", "success": true, "actions_count": 7}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (8, 8, '2026-09-15 16:00:00+03', '{"os": "Windows", "event": "create_order", "source": "web", "browser": "Chrome", "success": true, "actions_count": 8}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (10, 10, '2026-09-15 18:00:00+03', '{"os": "Windows", "event": "create_order", "source": "web", "browser": "Chrome", "success": true, "actions_count": 10}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (3, 3, '2026-09-15 11:00:00+03', '{"os": "Windows", "event": "login", "source": "web", "browser": "Firefox", "success": false, "actions_count": 0}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (6, 6, '2026-09-15 14:00:00+03', '{"os": "Windows", "event": "create_order", "source": "web", "browser": "Chrome", "success": false, "actions_count": 0}');
INSERT INTO port_p7.user_logs OVERRIDING SYSTEM VALUE VALUES (9, 9, '2026-09-15 17:00:00+03', '{"os": "Windows", "event": "login", "source": "web", "browser": "Firefox", "success": false, "actions_count": 0}');


--
-- TOC entry 5383 (class 0 OID 16861)
-- Dependencies: 275
-- Data for Name: vessel; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (1, 'Нева', 'UB1000', '9000015', 'Россия', 1, 1, 9, 10000.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (2, 'Ладога', 'UB1001', '9000027', 'Россия', 2, 2, 9, 11500.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (3, 'Онега', 'UB1002', '9000039', 'Россия', 3, 3, 9, 13000.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (4, 'Волхов', 'UB1003', '9000041', 'Россия', 4, 4, 9, 14500.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (5, 'Помор', 'UB1004', '9000053', 'Россия', 5, 5, 9, 16000.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (6, 'Север', 'UB1005', '9000065', 'Россия', 6, 6, 9, 17500.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (7, 'Дон', 'UB1006', '9000077', 'Россия', 7, 7, 9, 19000.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (8, 'Волга', 'UB1007', '9000089', 'Россия', 8, 8, 9, 20500.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (9, 'Енисей', 'UB1008', '9000091', 'Россия', 9, 9, 9, 22000.00);
INSERT INTO port_p7.vessel OVERRIDING SYSTEM VALUE VALUES (10, 'Амур', 'UB1009', '9000106', 'Россия', 10, 10, 9, 23500.00);


--
-- TOC entry 5385 (class 0 OID 16894)
-- Dependencies: 277
-- Data for Name: vessel_call; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (1, '2026-09-01 08:00:00+03', 1, 1, 'Выгрузка груза', 1, '2026-09-01 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (2, '2026-09-02 08:00:00+03', 2, 2, 'Выгрузка груза', 2, '2026-09-02 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (3, '2026-09-03 08:00:00+03', 3, 3, 'Выгрузка груза', 3, '2026-09-03 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (4, '2026-09-04 08:00:00+03', 4, 4, 'Выгрузка груза', 4, '2026-09-04 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (5, '2026-09-05 08:00:00+03', 5, 5, 'Выгрузка груза', 5, '2026-09-05 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (6, '2026-09-06 08:00:00+03', 6, 6, 'Выгрузка груза', 1, '2026-09-06 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (7, '2026-09-07 08:00:00+03', 7, 7, 'Выгрузка груза', 2, '2026-09-07 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (8, '2026-09-08 08:00:00+03', 8, 8, 'Выгрузка груза', 3, '2026-09-08 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (9, '2026-09-09 08:00:00+03', 9, 9, 'Выгрузка груза', 4, '2026-09-09 20:00:00+03');
INSERT INTO port_p7.vessel_call OVERRIDING SYSTEM VALUE VALUES (10, '2026-09-10 08:00:00+03', 10, 10, 'Выгрузка груза', 5, '2026-09-10 20:00:00+03');


--
-- TOC entry 5387 (class 0 OID 16921)
-- Dependencies: 279
-- Data for Name: vessel_call_service; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 10000.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 10000.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (3, 2, 1, 11500.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (4, 2, 2, 11500.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (5, 3, 1, 13000.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (6, 3, 2, 13000.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (7, 4, 1, 14500.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (8, 4, 2, 14500.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (9, 5, 1, 16000.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (10, 5, 2, 16000.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (11, 6, 1, 17500.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (12, 6, 2, 17500.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (13, 7, 1, 19000.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (14, 7, 2, 19000.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (15, 8, 1, 20500.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (16, 8, 2, 20500.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (17, 9, 1, 22000.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (18, 9, 2, 22000.000, 12.50, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (19, 10, 1, 23500.000, 10.00, DEFAULT);
INSERT INTO port_p7.vessel_call_service OVERRIDING SYSTEM VALUE VALUES (20, 10, 2, 23500.000, 12.50, DEFAULT);


--
-- TOC entry 5367 (class 0 OID 16765)
-- Dependencies: 259
-- Data for Name: vessel_status; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (1, 'Запланирован');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (2, 'На подходе');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (3, 'На рейде');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (4, 'Ожидает лоцмана');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (5, 'Швартуется');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (6, 'У причала');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (7, 'На грузовых работах');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (8, 'Готов к отходу');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (9, 'Вышел из порта');
INSERT INTO port_p7.vessel_status OVERRIDING SYSTEM VALUE VALUES (10, 'На ремонте');


--
-- TOC entry 5363 (class 0 OID 16743)
-- Dependencies: 255
-- Data for Name: vessel_type; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (1, 'Балкер', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (2, 'Танкер', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (3, 'Контейнеровоз', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (4, 'Сухогруз', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (5, 'Рефрижератор', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (6, 'Ролкер', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (7, 'Паром', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (8, 'Газовоз', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (9, 'Буксир', 'Учебный справочник типов судов');
INSERT INTO port_p7.vessel_type OVERRIDING SYSTEM VALUE VALUES (10, 'Пассажирское судно', 'Учебный справочник типов судов');


--
-- TOC entry 5393 (class 0 OID 16997)
-- Dependencies: 285
-- Data for Name: warehouse_order; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (1, 'WO-2026-001', '2026-09-01 14:00:00+03', 'ПРИХОД', 1, NULL, 6);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (2, 'WO-2026-002', '2026-09-01 18:00:00+03', 'РАСХОД', NULL, 1, 6);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (3, 'WO-2026-003', '2026-09-02 14:00:00+03', 'ПРИХОД', 2, NULL, 7);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (4, 'WO-2026-004', '2026-09-02 18:00:00+03', 'РАСХОД', NULL, 2, 7);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (5, 'WO-2026-005', '2026-09-03 14:00:00+03', 'ПРИХОД', 3, NULL, 8);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (6, 'WO-2026-006', '2026-09-03 18:00:00+03', 'РАСХОД', NULL, 3, 8);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (7, 'WO-2026-007', '2026-09-04 14:00:00+03', 'ПРИХОД', 4, NULL, 9);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (8, 'WO-2026-008', '2026-09-04 18:00:00+03', 'РАСХОД', NULL, 4, 9);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (9, 'WO-2026-009', '2026-09-05 14:00:00+03', 'ПРИХОД', 5, NULL, 10);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (10, 'WO-2026-010', '2026-09-05 18:00:00+03', 'РАСХОД', NULL, 5, 10);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (11, 'WO-2026-011', '2026-09-06 14:00:00+03', 'ПРИХОД', 6, NULL, 6);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (12, 'WO-2026-012', '2026-09-06 18:00:00+03', 'РАСХОД', NULL, 6, 6);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (13, 'WO-2026-013', '2026-09-07 14:00:00+03', 'ПРИХОД', 7, NULL, 7);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (14, 'WO-2026-014', '2026-09-07 18:00:00+03', 'РАСХОД', NULL, 7, 7);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (15, 'WO-2026-015', '2026-09-08 14:00:00+03', 'ПРИХОД', 8, NULL, 8);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (16, 'WO-2026-016', '2026-09-08 18:00:00+03', 'РАСХОД', NULL, 8, 8);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (17, 'WO-2026-017', '2026-09-09 14:00:00+03', 'ПРИХОД', 9, NULL, 9);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (18, 'WO-2026-018', '2026-09-09 18:00:00+03', 'РАСХОД', NULL, 9, 9);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (19, 'WO-2026-019', '2026-09-10 14:00:00+03', 'ПРИХОД', 10, NULL, 10);
INSERT INTO port_p7.warehouse_order OVERRIDING SYSTEM VALUE VALUES (20, 'WO-2026-020', '2026-09-10 18:00:00+03', 'РАСХОД', NULL, 10, 10);


--
-- TOC entry 5395 (class 0 OID 17027)
-- Dependencies: 287
-- Data for Name: warehouse_order_item; Type: TABLE DATA; Schema: port_p7; Owner: -
--

INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 100.000, 1, 'СКЛ-1/А-01', 'BATCH-2026-001');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (2, 2, 1, 20.000, 1, 'СКЛ-1/А-01', 'BATCH-2026-001');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (3, 3, 2, 110.000, 1, 'СКЛ-1/А-02', 'BATCH-2026-002');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (4, 4, 2, 20.000, 1, 'СКЛ-1/А-02', 'BATCH-2026-002');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (5, 5, 3, 120.000, 1, 'СКЛ-1/А-03', 'BATCH-2026-003');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (6, 6, 3, 20.000, 1, 'СКЛ-1/А-03', 'BATCH-2026-003');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (7, 7, 4, 130.000, 1, 'СКЛ-1/А-04', 'BATCH-2026-004');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (8, 8, 4, 20.000, 1, 'СКЛ-1/А-04', 'BATCH-2026-004');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (9, 9, 5, 140.000, 1, 'СКЛ-1/А-05', 'BATCH-2026-005');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (10, 10, 5, 20.000, 1, 'СКЛ-1/А-05', 'BATCH-2026-005');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (11, 11, 6, 150.000, 4, 'СКЛ-1/А-06', 'BATCH-2026-006');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (12, 12, 6, 20.000, 4, 'СКЛ-1/А-06', 'BATCH-2026-006');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (13, 13, 7, 160.000, 1, 'СКЛ-1/А-07', 'BATCH-2026-007');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (14, 14, 7, 20.000, 1, 'СКЛ-1/А-07', 'BATCH-2026-007');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (15, 15, 8, 170.000, 1, 'СКЛ-1/А-08', 'BATCH-2026-008');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (16, 16, 8, 20.000, 1, 'СКЛ-1/А-08', 'BATCH-2026-008');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (17, 17, 9, 180.000, 1, 'СКЛ-1/А-09', 'BATCH-2026-009');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (18, 18, 9, 20.000, 1, 'СКЛ-1/А-09', 'BATCH-2026-009');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (19, 19, 10, 190.000, 1, 'СКЛ-1/А-10', 'BATCH-2026-010');
INSERT INTO port_p7.warehouse_order_item OVERRIDING SYSTEM VALUE VALUES (20, 20, 10, 20.000, 1, 'СКЛ-1/А-10', 'BATCH-2026-010');


--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 227
-- Name: berth_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.berth_id_seq', 1, false);


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 243
-- Name: cargo_operation_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.cargo_operation_id_seq', 1, false);


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 245
-- Name: cargo_operation_item_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.cargo_operation_item_id_seq', 1, false);


--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 219
-- Name: cargo_type_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.cargo_type_id_seq', 1, false);


--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 233
-- Name: consignee_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.consignee_id_seq', 1, false);


--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 231
-- Name: consignor_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.consignor_id_seq', 1, false);


--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 235
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.employee_id_seq', 1, false);


--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 225
-- Name: fee_type_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.fee_type_id_seq', 1, false);


--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 229
-- Name: ship_owner_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.ship_owner_id_seq', 1, false);


--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 251
-- Name: stock_balance_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.stock_balance_id_seq', 1, false);


--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 223
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.unit_id_seq', 1, false);


--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 239
-- Name: vessel_call_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.vessel_call_id_seq', 1, false);


--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 241
-- Name: vessel_call_service_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.vessel_call_service_id_seq', 1, false);


--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 237
-- Name: vessel_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.vessel_id_seq', 1, false);


--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 221
-- Name: vessel_status_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.vessel_status_id_seq', 1, false);


--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 217
-- Name: vessel_type_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.vessel_type_id_seq', 1, false);


--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 247
-- Name: warehouse_order_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.warehouse_order_id_seq', 1, false);


--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 249
-- Name: warehouse_order_item_id_seq; Type: SEQUENCE SET; Schema: port_p6; Owner: -
--

SELECT pg_catalog.setval('port_p6.warehouse_order_item_id_seq', 1, false);


--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 264
-- Name: berth_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.berth_id_seq', 10, true);


--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 280
-- Name: cargo_operation_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.cargo_operation_id_seq', 10, true);


--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 282
-- Name: cargo_operation_item_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.cargo_operation_item_id_seq', 10, true);


--
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 256
-- Name: cargo_type_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.cargo_type_id_seq', 10, true);


--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 270
-- Name: consignee_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.consignee_id_seq', 10, true);


--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 268
-- Name: consignor_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.consignor_id_seq', 10, true);


--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 272
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.employee_id_seq', 10, true);


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 262
-- Name: fee_type_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.fee_type_id_seq', 10, true);


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 290
-- Name: port_department_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.port_department_id_seq', 10, true);


--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 266
-- Name: ship_owner_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.ship_owner_id_seq', 10, true);


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 288
-- Name: stock_balance_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.stock_balance_id_seq', 10, true);


--
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 260
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.unit_id_seq', 10, true);


--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 292
-- Name: user_logs_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.user_logs_id_seq', 10, true);


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 276
-- Name: vessel_call_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.vessel_call_id_seq', 10, true);


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 278
-- Name: vessel_call_service_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.vessel_call_service_id_seq', 20, true);


--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 274
-- Name: vessel_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.vessel_id_seq', 10, true);


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 258
-- Name: vessel_status_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.vessel_status_id_seq', 10, true);


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 254
-- Name: vessel_type_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.vessel_type_id_seq', 12, true);


--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 284
-- Name: warehouse_order_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.warehouse_order_id_seq', 20, true);


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 286
-- Name: warehouse_order_item_id_seq; Type: SEQUENCE SET; Schema: port_p7; Owner: -
--

SELECT pg_catalog.setval('port_p7.warehouse_order_item_id_seq', 20, true);


--
-- TOC entry 4969 (class 2606 OID 16505)
-- Name: berth berth_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.berth
    ADD CONSTRAINT berth_number_key UNIQUE (number);


--
-- TOC entry 4971 (class 2606 OID 16503)
-- Name: berth berth_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.berth
    ADD CONSTRAINT berth_pkey PRIMARY KEY (id);


--
-- TOC entry 5014 (class 2606 OID 16645)
-- Name: cargo_operation_item cargo_operation_item_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_pkey PRIMARY KEY (id);


--
-- TOC entry 5007 (class 2606 OID 16621)
-- Name: cargo_operation cargo_operation_operation_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation
    ADD CONSTRAINT cargo_operation_operation_number_key UNIQUE (operation_number);


--
-- TOC entry 5009 (class 2606 OID 16619)
-- Name: cargo_operation cargo_operation_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation
    ADD CONSTRAINT cargo_operation_pkey PRIMARY KEY (id);


--
-- TOC entry 4950 (class 2606 OID 16464)
-- Name: cargo_type cargo_type_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_type
    ADD CONSTRAINT cargo_type_name_key UNIQUE (name);


--
-- TOC entry 4952 (class 2606 OID 16462)
-- Name: cargo_type cargo_type_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_type
    ADD CONSTRAINT cargo_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 16527)
-- Name: consignee consignee_inn_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.consignee
    ADD CONSTRAINT consignee_inn_key UNIQUE (inn);


--
-- TOC entry 4981 (class 2606 OID 16525)
-- Name: consignee consignee_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.consignee
    ADD CONSTRAINT consignee_pkey PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 16519)
-- Name: consignor consignor_inn_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.consignor
    ADD CONSTRAINT consignor_inn_key UNIQUE (inn);


--
-- TOC entry 4977 (class 2606 OID 16517)
-- Name: consignor consignor_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.consignor
    ADD CONSTRAINT consignor_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 16537)
-- Name: employee employee_employee_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.employee
    ADD CONSTRAINT employee_employee_number_key UNIQUE (employee_number);


--
-- TOC entry 4985 (class 2606 OID 16539)
-- Name: employee employee_login_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.employee
    ADD CONSTRAINT employee_login_key UNIQUE (login);


--
-- TOC entry 4987 (class 2606 OID 16535)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 16490)
-- Name: fee_type fee_type_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.fee_type
    ADD CONSTRAINT fee_type_name_key UNIQUE (name);


--
-- TOC entry 4966 (class 2606 OID 16488)
-- Name: fee_type fee_type_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.fee_type
    ADD CONSTRAINT fee_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 16511)
-- Name: ship_owner ship_owner_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.ship_owner
    ADD CONSTRAINT ship_owner_pkey PRIMARY KEY (id);


--
-- TOC entry 5033 (class 2606 OID 16724)
-- Name: stock_balance stock_balance_cargo_type_id_unit_id_location_batch_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.stock_balance
    ADD CONSTRAINT stock_balance_cargo_type_id_unit_id_location_batch_number_key UNIQUE (cargo_type_id, unit_id, location, batch_number);


--
-- TOC entry 5035 (class 2606 OID 16722)
-- Name: stock_balance stock_balance_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.stock_balance
    ADD CONSTRAINT stock_balance_pkey PRIMARY KEY (id);


--
-- TOC entry 4958 (class 2606 OID 16480)
-- Name: unit unit_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.unit
    ADD CONSTRAINT unit_name_key UNIQUE (name);


--
-- TOC entry 4960 (class 2606 OID 16478)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- TOC entry 4962 (class 2606 OID 16482)
-- Name: unit unit_short_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.unit
    ADD CONSTRAINT unit_short_name_key UNIQUE (short_name);


--
-- TOC entry 5001 (class 2606 OID 16574)
-- Name: vessel_call vessel_call_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call
    ADD CONSTRAINT vessel_call_pkey PRIMARY KEY (id);


--
-- TOC entry 5005 (class 2606 OID 16600)
-- Name: vessel_call_service vessel_call_service_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call_service
    ADD CONSTRAINT vessel_call_service_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 16547)
-- Name: vessel vessel_call_sign_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_call_sign_key UNIQUE (call_sign);


--
-- TOC entry 4994 (class 2606 OID 16549)
-- Name: vessel vessel_imo_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_imo_number_key UNIQUE (imo_number);


--
-- TOC entry 4996 (class 2606 OID 16545)
-- Name: vessel vessel_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_pkey PRIMARY KEY (id);


--
-- TOC entry 4954 (class 2606 OID 16472)
-- Name: vessel_status vessel_status_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_status
    ADD CONSTRAINT vessel_status_name_key UNIQUE (name);


--
-- TOC entry 4956 (class 2606 OID 16470)
-- Name: vessel_status vessel_status_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_status
    ADD CONSTRAINT vessel_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4946 (class 2606 OID 16455)
-- Name: vessel_type vessel_type_name_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_type
    ADD CONSTRAINT vessel_type_name_key UNIQUE (name);


--
-- TOC entry 4948 (class 2606 OID 16453)
-- Name: vessel_type vessel_type_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_type
    ADD CONSTRAINT vessel_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5029 (class 2606 OID 16696)
-- Name: warehouse_order_item warehouse_order_item_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_pkey PRIMARY KEY (id);


--
-- TOC entry 5022 (class 2606 OID 16672)
-- Name: warehouse_order warehouse_order_order_number_key; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order
    ADD CONSTRAINT warehouse_order_order_number_key UNIQUE (order_number);


--
-- TOC entry 5024 (class 2606 OID 16670)
-- Name: warehouse_order warehouse_order_pkey; Type: CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order
    ADD CONSTRAINT warehouse_order_pkey PRIMARY KEY (id);


--
-- TOC entry 5060 (class 2606 OID 16811)
-- Name: berth berth_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.berth
    ADD CONSTRAINT berth_number_key UNIQUE (number);


--
-- TOC entry 5062 (class 2606 OID 16809)
-- Name: berth berth_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.berth
    ADD CONSTRAINT berth_pkey PRIMARY KEY (id);


--
-- TOC entry 5105 (class 2606 OID 16977)
-- Name: cargo_operation_item cargo_operation_item_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_pkey PRIMARY KEY (id);


--
-- TOC entry 5098 (class 2606 OID 16952)
-- Name: cargo_operation cargo_operation_operation_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation
    ADD CONSTRAINT cargo_operation_operation_number_key UNIQUE (operation_number);


--
-- TOC entry 5100 (class 2606 OID 16950)
-- Name: cargo_operation cargo_operation_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation
    ADD CONSTRAINT cargo_operation_pkey PRIMARY KEY (id);


--
-- TOC entry 5041 (class 2606 OID 16763)
-- Name: cargo_type cargo_type_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_type
    ADD CONSTRAINT cargo_type_name_key UNIQUE (name);


--
-- TOC entry 5043 (class 2606 OID 16761)
-- Name: cargo_type cargo_type_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_type
    ADD CONSTRAINT cargo_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5070 (class 2606 OID 16842)
-- Name: consignee consignee_inn_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.consignee
    ADD CONSTRAINT consignee_inn_key UNIQUE (inn);


--
-- TOC entry 5072 (class 2606 OID 16840)
-- Name: consignee consignee_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.consignee
    ADD CONSTRAINT consignee_pkey PRIMARY KEY (id);


--
-- TOC entry 5066 (class 2606 OID 16831)
-- Name: consignor consignor_inn_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.consignor
    ADD CONSTRAINT consignor_inn_key UNIQUE (inn);


--
-- TOC entry 5068 (class 2606 OID 16829)
-- Name: consignor consignor_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.consignor
    ADD CONSTRAINT consignor_pkey PRIMARY KEY (id);


--
-- TOC entry 5074 (class 2606 OID 16857)
-- Name: employee employee_employee_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.employee
    ADD CONSTRAINT employee_employee_number_key UNIQUE (employee_number);


--
-- TOC entry 5076 (class 2606 OID 16859)
-- Name: employee employee_login_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.employee
    ADD CONSTRAINT employee_login_key UNIQUE (login);


--
-- TOC entry 5078 (class 2606 OID 16855)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 5055 (class 2606 OID 16794)
-- Name: fee_type fee_type_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.fee_type
    ADD CONSTRAINT fee_type_name_key UNIQUE (name);


--
-- TOC entry 5057 (class 2606 OID 16792)
-- Name: fee_type fee_type_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.fee_type
    ADD CONSTRAINT fee_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5128 (class 2606 OID 17090)
-- Name: port_department port_department_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.port_department
    ADD CONSTRAINT port_department_name_key UNIQUE (name);


--
-- TOC entry 5131 (class 2606 OID 17088)
-- Name: port_department port_department_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.port_department
    ADD CONSTRAINT port_department_pkey PRIMARY KEY (id);


--
-- TOC entry 5064 (class 2606 OID 16820)
-- Name: ship_owner ship_owner_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.ship_owner
    ADD CONSTRAINT ship_owner_pkey PRIMARY KEY (id);


--
-- TOC entry 5124 (class 2606 OID 17065)
-- Name: stock_balance stock_balance_cargo_type_id_unit_id_location_batch_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.stock_balance
    ADD CONSTRAINT stock_balance_cargo_type_id_unit_id_location_batch_number_key UNIQUE (cargo_type_id, unit_id, location, batch_number);


--
-- TOC entry 5126 (class 2606 OID 17063)
-- Name: stock_balance stock_balance_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.stock_balance
    ADD CONSTRAINT stock_balance_pkey PRIMARY KEY (id);


--
-- TOC entry 5049 (class 2606 OID 16782)
-- Name: unit unit_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.unit
    ADD CONSTRAINT unit_name_key UNIQUE (name);


--
-- TOC entry 5051 (class 2606 OID 16780)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- TOC entry 5053 (class 2606 OID 16784)
-- Name: unit unit_short_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.unit
    ADD CONSTRAINT unit_short_name_key UNIQUE (short_name);


--
-- TOC entry 5134 (class 2606 OID 17105)
-- Name: user_logs user_logs_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.user_logs
    ADD CONSTRAINT user_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 5092 (class 2606 OID 16901)
-- Name: vessel_call vessel_call_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call
    ADD CONSTRAINT vessel_call_pkey PRIMARY KEY (id);


--
-- TOC entry 5096 (class 2606 OID 16929)
-- Name: vessel_call_service vessel_call_service_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call_service
    ADD CONSTRAINT vessel_call_service_pkey PRIMARY KEY (id);


--
-- TOC entry 5083 (class 2606 OID 16872)
-- Name: vessel vessel_call_sign_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_call_sign_key UNIQUE (call_sign);


--
-- TOC entry 5085 (class 2606 OID 16874)
-- Name: vessel vessel_imo_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_imo_number_key UNIQUE (imo_number);


--
-- TOC entry 5087 (class 2606 OID 16870)
-- Name: vessel vessel_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_pkey PRIMARY KEY (id);


--
-- TOC entry 5045 (class 2606 OID 16772)
-- Name: vessel_status vessel_status_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_status
    ADD CONSTRAINT vessel_status_name_key UNIQUE (name);


--
-- TOC entry 5047 (class 2606 OID 16770)
-- Name: vessel_status vessel_status_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_status
    ADD CONSTRAINT vessel_status_pkey PRIMARY KEY (id);


--
-- TOC entry 5037 (class 2606 OID 16752)
-- Name: vessel_type vessel_type_name_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_type
    ADD CONSTRAINT vessel_type_name_key UNIQUE (name);


--
-- TOC entry 5039 (class 2606 OID 16750)
-- Name: vessel_type vessel_type_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_type
    ADD CONSTRAINT vessel_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5120 (class 2606 OID 17034)
-- Name: warehouse_order_item warehouse_order_item_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_pkey PRIMARY KEY (id);


--
-- TOC entry 5113 (class 2606 OID 17007)
-- Name: warehouse_order warehouse_order_order_number_key; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order
    ADD CONSTRAINT warehouse_order_order_number_key UNIQUE (order_number);


--
-- TOC entry 5115 (class 2606 OID 17005)
-- Name: warehouse_order warehouse_order_pkey; Type: CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order
    ADD CONSTRAINT warehouse_order_pkey PRIMARY KEY (id);


--
-- TOC entry 5010 (class 1259 OID 16639)
-- Name: ix_cargo_operation_consignee_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_consignee_id ON port_p6.cargo_operation USING btree (consignee_id);


--
-- TOC entry 5011 (class 1259 OID 16638)
-- Name: ix_cargo_operation_consignor_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_consignor_id ON port_p6.cargo_operation USING btree (consignor_id);


--
-- TOC entry 5015 (class 1259 OID 16661)
-- Name: ix_cargo_operation_item_cargo_operation_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_item_cargo_operation_id ON port_p6.cargo_operation_item USING btree (cargo_operation_id);


--
-- TOC entry 5016 (class 1259 OID 16662)
-- Name: ix_cargo_operation_item_cargo_type_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_item_cargo_type_id ON port_p6.cargo_operation_item USING btree (cargo_type_id);


--
-- TOC entry 5017 (class 1259 OID 16663)
-- Name: ix_cargo_operation_item_unit_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_item_unit_id ON port_p6.cargo_operation_item USING btree (unit_id);


--
-- TOC entry 5012 (class 1259 OID 16637)
-- Name: ix_cargo_operation_vessel_call_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_cargo_operation_vessel_call_id ON port_p6.cargo_operation USING btree (vessel_call_id);


--
-- TOC entry 4967 (class 1259 OID 16496)
-- Name: ix_fee_type_unit_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_fee_type_unit_id ON port_p6.fee_type USING btree (unit_id);


--
-- TOC entry 5030 (class 1259 OID 16735)
-- Name: ix_stock_balance_cargo_type_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_stock_balance_cargo_type_id ON port_p6.stock_balance USING btree (cargo_type_id);


--
-- TOC entry 5031 (class 1259 OID 16736)
-- Name: ix_stock_balance_unit_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_stock_balance_unit_id ON port_p6.stock_balance USING btree (unit_id);


--
-- TOC entry 4997 (class 1259 OID 16591)
-- Name: ix_vessel_call_berth_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_call_berth_id ON port_p6.vessel_call USING btree (berth_id);


--
-- TOC entry 4998 (class 1259 OID 16592)
-- Name: ix_vessel_call_dispatcher_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_call_dispatcher_id ON port_p6.vessel_call USING btree (dispatcher_id);


--
-- TOC entry 5002 (class 1259 OID 16612)
-- Name: ix_vessel_call_service_fee_type_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_call_service_fee_type_id ON port_p6.vessel_call_service USING btree (fee_type_id);


--
-- TOC entry 5003 (class 1259 OID 16611)
-- Name: ix_vessel_call_service_vessel_call_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_call_service_vessel_call_id ON port_p6.vessel_call_service USING btree (vessel_call_id);


--
-- TOC entry 4999 (class 1259 OID 16590)
-- Name: ix_vessel_call_vessel_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_call_vessel_id ON port_p6.vessel_call USING btree (vessel_id);


--
-- TOC entry 4988 (class 1259 OID 16566)
-- Name: ix_vessel_ship_owner_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_ship_owner_id ON port_p6.vessel USING btree (ship_owner_id);


--
-- TOC entry 4989 (class 1259 OID 16567)
-- Name: ix_vessel_vessel_status_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_vessel_status_id ON port_p6.vessel USING btree (vessel_status_id);


--
-- TOC entry 4990 (class 1259 OID 16565)
-- Name: ix_vessel_vessel_type_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_vessel_vessel_type_id ON port_p6.vessel USING btree (vessel_type_id);


--
-- TOC entry 5018 (class 1259 OID 16689)
-- Name: ix_warehouse_order_consignee_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_consignee_id ON port_p6.warehouse_order USING btree (consignee_id);


--
-- TOC entry 5019 (class 1259 OID 16688)
-- Name: ix_warehouse_order_consignor_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_consignor_id ON port_p6.warehouse_order USING btree (consignor_id);


--
-- TOC entry 5025 (class 1259 OID 16713)
-- Name: ix_warehouse_order_item_cargo_type_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_item_cargo_type_id ON port_p6.warehouse_order_item USING btree (cargo_type_id);


--
-- TOC entry 5026 (class 1259 OID 16714)
-- Name: ix_warehouse_order_item_unit_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_item_unit_id ON port_p6.warehouse_order_item USING btree (unit_id);


--
-- TOC entry 5027 (class 1259 OID 16712)
-- Name: ix_warehouse_order_item_warehouse_order_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_item_warehouse_order_id ON port_p6.warehouse_order_item USING btree (warehouse_order_id);


--
-- TOC entry 5020 (class 1259 OID 16690)
-- Name: ix_warehouse_order_responsible_emp_id; Type: INDEX; Schema: port_p6; Owner: -
--

CREATE INDEX ix_warehouse_order_responsible_emp_id ON port_p6.warehouse_order USING btree (responsible_emp_id);


--
-- TOC entry 5101 (class 1259 OID 16970)
-- Name: ix_cargo_operation_consignee_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_consignee_id ON port_p7.cargo_operation USING btree (consignee_id);


--
-- TOC entry 5102 (class 1259 OID 16969)
-- Name: ix_cargo_operation_consignor_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_consignor_id ON port_p7.cargo_operation USING btree (consignor_id);


--
-- TOC entry 5106 (class 1259 OID 16993)
-- Name: ix_cargo_operation_item_cargo_operation_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_item_cargo_operation_id ON port_p7.cargo_operation_item USING btree (cargo_operation_id);


--
-- TOC entry 5107 (class 1259 OID 16994)
-- Name: ix_cargo_operation_item_cargo_type_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_item_cargo_type_id ON port_p7.cargo_operation_item USING btree (cargo_type_id);


--
-- TOC entry 5108 (class 1259 OID 16995)
-- Name: ix_cargo_operation_item_unit_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_item_unit_id ON port_p7.cargo_operation_item USING btree (unit_id);


--
-- TOC entry 5103 (class 1259 OID 16968)
-- Name: ix_cargo_operation_vessel_call_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_cargo_operation_vessel_call_id ON port_p7.cargo_operation USING btree (vessel_call_id);


--
-- TOC entry 5058 (class 1259 OID 16800)
-- Name: ix_fee_type_unit_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_fee_type_unit_id ON port_p7.fee_type USING btree (unit_id);


--
-- TOC entry 5121 (class 1259 OID 17076)
-- Name: ix_stock_balance_cargo_type_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_stock_balance_cargo_type_id ON port_p7.stock_balance USING btree (cargo_type_id);


--
-- TOC entry 5122 (class 1259 OID 17077)
-- Name: ix_stock_balance_unit_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_stock_balance_unit_id ON port_p7.stock_balance USING btree (unit_id);


--
-- TOC entry 5088 (class 1259 OID 16918)
-- Name: ix_vessel_call_berth_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_call_berth_id ON port_p7.vessel_call USING btree (berth_id);


--
-- TOC entry 5089 (class 1259 OID 16919)
-- Name: ix_vessel_call_dispatcher_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_call_dispatcher_id ON port_p7.vessel_call USING btree (dispatcher_id);


--
-- TOC entry 5093 (class 1259 OID 16941)
-- Name: ix_vessel_call_service_fee_type_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_call_service_fee_type_id ON port_p7.vessel_call_service USING btree (fee_type_id);


--
-- TOC entry 5094 (class 1259 OID 16940)
-- Name: ix_vessel_call_service_vessel_call_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_call_service_vessel_call_id ON port_p7.vessel_call_service USING btree (vessel_call_id);


--
-- TOC entry 5090 (class 1259 OID 16917)
-- Name: ix_vessel_call_vessel_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_call_vessel_id ON port_p7.vessel_call USING btree (vessel_id);


--
-- TOC entry 5079 (class 1259 OID 16891)
-- Name: ix_vessel_ship_owner_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_ship_owner_id ON port_p7.vessel USING btree (ship_owner_id);


--
-- TOC entry 5080 (class 1259 OID 16892)
-- Name: ix_vessel_vessel_status_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_vessel_status_id ON port_p7.vessel USING btree (vessel_status_id);


--
-- TOC entry 5081 (class 1259 OID 16890)
-- Name: ix_vessel_vessel_type_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_vessel_vessel_type_id ON port_p7.vessel USING btree (vessel_type_id);


--
-- TOC entry 5109 (class 1259 OID 17024)
-- Name: ix_warehouse_order_consignee_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_consignee_id ON port_p7.warehouse_order USING btree (consignee_id);


--
-- TOC entry 5110 (class 1259 OID 17023)
-- Name: ix_warehouse_order_consignor_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_consignor_id ON port_p7.warehouse_order USING btree (consignor_id);


--
-- TOC entry 5116 (class 1259 OID 17051)
-- Name: ix_warehouse_order_item_cargo_type_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_item_cargo_type_id ON port_p7.warehouse_order_item USING btree (cargo_type_id);


--
-- TOC entry 5117 (class 1259 OID 17052)
-- Name: ix_warehouse_order_item_unit_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_item_unit_id ON port_p7.warehouse_order_item USING btree (unit_id);


--
-- TOC entry 5118 (class 1259 OID 17050)
-- Name: ix_warehouse_order_item_warehouse_order_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_item_warehouse_order_id ON port_p7.warehouse_order_item USING btree (warehouse_order_id);


--
-- TOC entry 5111 (class 1259 OID 17025)
-- Name: ix_warehouse_order_responsible_emp_id; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX ix_warehouse_order_responsible_emp_id ON port_p7.warehouse_order USING btree (responsible_emp_id);


--
-- TOC entry 5129 (class 1259 OID 17096)
-- Name: port_department_parent_idx; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX port_department_parent_idx ON port_p7.port_department USING btree (parent_id);


--
-- TOC entry 5132 (class 1259 OID 17111)
-- Name: user_logs_employee_idx; Type: INDEX; Schema: port_p7; Owner: -
--

CREATE INDEX user_logs_employee_idx ON port_p7.user_logs USING btree (employee_id);


--
-- TOC entry 5144 (class 2606 OID 16632)
-- Name: cargo_operation cargo_operation_consignee_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation
    ADD CONSTRAINT cargo_operation_consignee_id_fkey FOREIGN KEY (consignee_id) REFERENCES port_p6.consignee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5145 (class 2606 OID 16627)
-- Name: cargo_operation cargo_operation_consignor_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation
    ADD CONSTRAINT cargo_operation_consignor_id_fkey FOREIGN KEY (consignor_id) REFERENCES port_p6.consignor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5147 (class 2606 OID 16646)
-- Name: cargo_operation_item cargo_operation_item_cargo_operation_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_cargo_operation_id_fkey FOREIGN KEY (cargo_operation_id) REFERENCES port_p6.cargo_operation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5148 (class 2606 OID 16651)
-- Name: cargo_operation_item cargo_operation_item_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p6.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5149 (class 2606 OID 16656)
-- Name: cargo_operation_item cargo_operation_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p6.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5146 (class 2606 OID 16622)
-- Name: cargo_operation cargo_operation_vessel_call_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.cargo_operation
    ADD CONSTRAINT cargo_operation_vessel_call_id_fkey FOREIGN KEY (vessel_call_id) REFERENCES port_p6.vessel_call(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5135 (class 2606 OID 16491)
-- Name: fee_type fee_type_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.fee_type
    ADD CONSTRAINT fee_type_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p6.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5156 (class 2606 OID 16725)
-- Name: stock_balance stock_balance_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.stock_balance
    ADD CONSTRAINT stock_balance_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p6.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5157 (class 2606 OID 16730)
-- Name: stock_balance stock_balance_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.stock_balance
    ADD CONSTRAINT stock_balance_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p6.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5139 (class 2606 OID 16580)
-- Name: vessel_call vessel_call_berth_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call
    ADD CONSTRAINT vessel_call_berth_id_fkey FOREIGN KEY (berth_id) REFERENCES port_p6.berth(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5140 (class 2606 OID 16585)
-- Name: vessel_call vessel_call_dispatcher_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call
    ADD CONSTRAINT vessel_call_dispatcher_id_fkey FOREIGN KEY (dispatcher_id) REFERENCES port_p6.employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5142 (class 2606 OID 16606)
-- Name: vessel_call_service vessel_call_service_fee_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call_service
    ADD CONSTRAINT vessel_call_service_fee_type_id_fkey FOREIGN KEY (fee_type_id) REFERENCES port_p6.fee_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5143 (class 2606 OID 16601)
-- Name: vessel_call_service vessel_call_service_vessel_call_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call_service
    ADD CONSTRAINT vessel_call_service_vessel_call_id_fkey FOREIGN KEY (vessel_call_id) REFERENCES port_p6.vessel_call(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5141 (class 2606 OID 16575)
-- Name: vessel_call vessel_call_vessel_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel_call
    ADD CONSTRAINT vessel_call_vessel_id_fkey FOREIGN KEY (vessel_id) REFERENCES port_p6.vessel(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5136 (class 2606 OID 16555)
-- Name: vessel vessel_ship_owner_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_ship_owner_id_fkey FOREIGN KEY (ship_owner_id) REFERENCES port_p6.ship_owner(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5137 (class 2606 OID 16560)
-- Name: vessel vessel_vessel_status_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_vessel_status_id_fkey FOREIGN KEY (vessel_status_id) REFERENCES port_p6.vessel_status(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5138 (class 2606 OID 16550)
-- Name: vessel vessel_vessel_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.vessel
    ADD CONSTRAINT vessel_vessel_type_id_fkey FOREIGN KEY (vessel_type_id) REFERENCES port_p6.vessel_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5150 (class 2606 OID 16678)
-- Name: warehouse_order warehouse_order_consignee_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order
    ADD CONSTRAINT warehouse_order_consignee_id_fkey FOREIGN KEY (consignee_id) REFERENCES port_p6.consignee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5151 (class 2606 OID 16673)
-- Name: warehouse_order warehouse_order_consignor_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order
    ADD CONSTRAINT warehouse_order_consignor_id_fkey FOREIGN KEY (consignor_id) REFERENCES port_p6.consignor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5153 (class 2606 OID 16702)
-- Name: warehouse_order_item warehouse_order_item_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p6.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5154 (class 2606 OID 16707)
-- Name: warehouse_order_item warehouse_order_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p6.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5155 (class 2606 OID 16697)
-- Name: warehouse_order_item warehouse_order_item_warehouse_order_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_warehouse_order_id_fkey FOREIGN KEY (warehouse_order_id) REFERENCES port_p6.warehouse_order(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5152 (class 2606 OID 16683)
-- Name: warehouse_order warehouse_order_responsible_emp_id_fkey; Type: FK CONSTRAINT; Schema: port_p6; Owner: -
--

ALTER TABLE ONLY port_p6.warehouse_order
    ADD CONSTRAINT warehouse_order_responsible_emp_id_fkey FOREIGN KEY (responsible_emp_id) REFERENCES port_p6.employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5167 (class 2606 OID 16963)
-- Name: cargo_operation cargo_operation_consignee_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation
    ADD CONSTRAINT cargo_operation_consignee_id_fkey FOREIGN KEY (consignee_id) REFERENCES port_p7.consignee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5168 (class 2606 OID 16958)
-- Name: cargo_operation cargo_operation_consignor_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation
    ADD CONSTRAINT cargo_operation_consignor_id_fkey FOREIGN KEY (consignor_id) REFERENCES port_p7.consignor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5170 (class 2606 OID 16978)
-- Name: cargo_operation_item cargo_operation_item_cargo_operation_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_cargo_operation_id_fkey FOREIGN KEY (cargo_operation_id) REFERENCES port_p7.cargo_operation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5171 (class 2606 OID 16983)
-- Name: cargo_operation_item cargo_operation_item_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p7.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5172 (class 2606 OID 16988)
-- Name: cargo_operation_item cargo_operation_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation_item
    ADD CONSTRAINT cargo_operation_item_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p7.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5169 (class 2606 OID 16953)
-- Name: cargo_operation cargo_operation_vessel_call_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.cargo_operation
    ADD CONSTRAINT cargo_operation_vessel_call_id_fkey FOREIGN KEY (vessel_call_id) REFERENCES port_p7.vessel_call(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5158 (class 2606 OID 16795)
-- Name: fee_type fee_type_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.fee_type
    ADD CONSTRAINT fee_type_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p7.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5181 (class 2606 OID 17091)
-- Name: port_department port_department_parent_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.port_department
    ADD CONSTRAINT port_department_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES port_p7.port_department(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5179 (class 2606 OID 17066)
-- Name: stock_balance stock_balance_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.stock_balance
    ADD CONSTRAINT stock_balance_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p7.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5180 (class 2606 OID 17071)
-- Name: stock_balance stock_balance_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.stock_balance
    ADD CONSTRAINT stock_balance_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p7.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5182 (class 2606 OID 17106)
-- Name: user_logs user_logs_employee_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.user_logs
    ADD CONSTRAINT user_logs_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES port_p7.employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5162 (class 2606 OID 16907)
-- Name: vessel_call vessel_call_berth_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call
    ADD CONSTRAINT vessel_call_berth_id_fkey FOREIGN KEY (berth_id) REFERENCES port_p7.berth(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5163 (class 2606 OID 16912)
-- Name: vessel_call vessel_call_dispatcher_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call
    ADD CONSTRAINT vessel_call_dispatcher_id_fkey FOREIGN KEY (dispatcher_id) REFERENCES port_p7.employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5165 (class 2606 OID 16935)
-- Name: vessel_call_service vessel_call_service_fee_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call_service
    ADD CONSTRAINT vessel_call_service_fee_type_id_fkey FOREIGN KEY (fee_type_id) REFERENCES port_p7.fee_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5166 (class 2606 OID 16930)
-- Name: vessel_call_service vessel_call_service_vessel_call_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call_service
    ADD CONSTRAINT vessel_call_service_vessel_call_id_fkey FOREIGN KEY (vessel_call_id) REFERENCES port_p7.vessel_call(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5164 (class 2606 OID 16902)
-- Name: vessel_call vessel_call_vessel_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel_call
    ADD CONSTRAINT vessel_call_vessel_id_fkey FOREIGN KEY (vessel_id) REFERENCES port_p7.vessel(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5159 (class 2606 OID 16880)
-- Name: vessel vessel_ship_owner_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_ship_owner_id_fkey FOREIGN KEY (ship_owner_id) REFERENCES port_p7.ship_owner(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5160 (class 2606 OID 16885)
-- Name: vessel vessel_vessel_status_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_vessel_status_id_fkey FOREIGN KEY (vessel_status_id) REFERENCES port_p7.vessel_status(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5161 (class 2606 OID 16875)
-- Name: vessel vessel_vessel_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.vessel
    ADD CONSTRAINT vessel_vessel_type_id_fkey FOREIGN KEY (vessel_type_id) REFERENCES port_p7.vessel_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5173 (class 2606 OID 17013)
-- Name: warehouse_order warehouse_order_consignee_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order
    ADD CONSTRAINT warehouse_order_consignee_id_fkey FOREIGN KEY (consignee_id) REFERENCES port_p7.consignee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5174 (class 2606 OID 17008)
-- Name: warehouse_order warehouse_order_consignor_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order
    ADD CONSTRAINT warehouse_order_consignor_id_fkey FOREIGN KEY (consignor_id) REFERENCES port_p7.consignor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5176 (class 2606 OID 17040)
-- Name: warehouse_order_item warehouse_order_item_cargo_type_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_cargo_type_id_fkey FOREIGN KEY (cargo_type_id) REFERENCES port_p7.cargo_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5177 (class 2606 OID 17045)
-- Name: warehouse_order_item warehouse_order_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES port_p7.unit(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5178 (class 2606 OID 17035)
-- Name: warehouse_order_item warehouse_order_item_warehouse_order_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order_item
    ADD CONSTRAINT warehouse_order_item_warehouse_order_id_fkey FOREIGN KEY (warehouse_order_id) REFERENCES port_p7.warehouse_order(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5175 (class 2606 OID 17018)
-- Name: warehouse_order warehouse_order_responsible_emp_id_fkey; Type: FK CONSTRAINT; Schema: port_p7; Owner: -
--

ALTER TABLE ONLY port_p7.warehouse_order
    ADD CONSTRAINT warehouse_order_responsible_emp_id_fkey FOREIGN KEY (responsible_emp_id) REFERENCES port_p7.employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-09-29 15:07:30

--
-- PostgreSQL database dump complete
--

