PGDMP         )            	    v           biosip    10.5    10.5 Z    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    49949    biosip    DATABASE     �   CREATE DATABASE biosip WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE biosip;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    49950    categoria_seq    SEQUENCE     v   CREATE SEQUENCE public.categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.categoria_seq;
       public       postgres    false    3            �            1259    49952 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id integer DEFAULT nextval('public.categoria_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(500) NOT NULL
);
    DROP TABLE public.categoria;
       public         postgres    false    196    3            �            1259    49959    confirmacion    TABLE     �   CREATE TABLE public.confirmacion (
    token character(100) NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_de_alta timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
     DROP TABLE public.confirmacion;
       public         postgres    false    3            �            1259    49963    kit    TABLE     �   CREATE TABLE public.kit (
    id bigint NOT NULL,
    usuario_id_autor bigint NOT NULL,
    fecha_de_expiracion timestamp without time zone NOT NULL,
    administrador_id_aprobador bigint
);
    DROP TABLE public.kit;
       public         postgres    false    3            �            1259    49966    kit_material    TABLE     �   CREATE TABLE public.kit_material (
    kit_id bigint NOT NULL,
    material_id bigint NOT NULL,
    num_elementos_requeridos integer NOT NULL
);
     DROP TABLE public.kit_material;
       public         postgres    false    3            �            1259    49969    material_seq    SEQUENCE     u   CREATE SEQUENCE public.material_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.material_seq;
       public       postgres    false    3            �            1259    49971    material    TABLE       CREATE TABLE public.material (
    id bigint DEFAULT nextval('public.material_seq'::regclass) NOT NULL,
    nombre character varying(200) NOT NULL,
    disponibles integer NOT NULL,
    ruta_imagen character varying(100),
    descripcion character varying(500) NOT NULL
);
    DROP TABLE public.material;
       public         postgres    false    201    3            �            1259    49978    material_categoria    TABLE     o   CREATE TABLE public.material_categoria (
    material_id bigint NOT NULL,
    categoria_id integer NOT NULL
);
 &   DROP TABLE public.material_categoria;
       public         postgres    false    3            �            1259    49981    material_subcategoria    TABLE     u   CREATE TABLE public.material_subcategoria (
    material_id bigint NOT NULL,
    subcategoria_id integer NOT NULL
);
 )   DROP TABLE public.material_subcategoria;
       public         postgres    false    3            �            1259    49984 
   perfil_seq    SEQUENCE     s   CREATE SEQUENCE public.perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.perfil_seq;
       public       postgres    false    3            �            1259    49986    perfil    TABLE     �   CREATE TABLE public.perfil (
    id smallint DEFAULT nextval('public.perfil_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.perfil;
       public         postgres    false    205    3            �            1259    50140    prestamo_seq    SEQUENCE     u   CREATE SEQUENCE public.prestamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.prestamo_seq;
       public       postgres    false    3            �            1259    49990    prestamo    TABLE     r  CREATE TABLE public.prestamo (
    id bigint DEFAULT nextval('public.prestamo_seq'::regclass) NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_de_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_de_aprobacion timestamp without time zone,
    administrador_id_aprobador bigint,
    fecha_de_devolucion timestamp without time zone
);
    DROP TABLE public.prestamo;
       public         postgres    false    214    3            �            1259    49994    prestamo_material    TABLE     �   CREATE TABLE public.prestamo_material (
    prestamo_id bigint NOT NULL,
    material_id bigint NOT NULL,
    elementos_prestados integer NOT NULL
);
 %   DROP TABLE public.prestamo_material;
       public         postgres    false    3            �            1259    49997    subcategoria_seq    SEQUENCE     y   CREATE SEQUENCE public.subcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.subcategoria_seq;
       public       postgres    false    3            �            1259    49999    subcategoria    TABLE     �   CREATE TABLE public.subcategoria (
    id integer DEFAULT nextval('public.subcategoria_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(500) NOT NULL,
    categoria_id integer
);
     DROP TABLE public.subcategoria;
       public         postgres    false    209    3            �            1259    50006    usuario_seq    SEQUENCE     t   CREATE SEQUENCE public.usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.usuario_seq;
       public       postgres    false    3            �            1259    50008    usuario    TABLE     �  CREATE TABLE public.usuario (
    id bigint DEFAULT nextval('public.usuario_seq'::regclass) NOT NULL,
    nombre_completo character varying(210) NOT NULL,
    user_name character varying(50) NOT NULL,
    correo_ciencias character varying(150) NOT NULL,
    password character varying(100) NOT NULL,
    fecha_de_desbloqueo timestamp without time zone,
    ruta_imagen character varying(100),
    validado boolean DEFAULT false NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false    211    3            �            1259    50016    usuario_perfil    TABLE     h   CREATE TABLE public.usuario_perfil (
    usuario_id bigint NOT NULL,
    perfil_id smallint NOT NULL
);
 "   DROP TABLE public.usuario_perfil;
       public         postgres    false    3            h          0    49952 	   categoria 
   TABLE DATA               <   COPY public.categoria (id, nombre, descripcion) FROM stdin;
    public       postgres    false    197   @g       i          0    49959    confirmacion 
   TABLE DATA               H   COPY public.confirmacion (token, usuario_id, fecha_de_alta) FROM stdin;
    public       postgres    false    198   ]g       j          0    49963    kit 
   TABLE DATA               d   COPY public.kit (id, usuario_id_autor, fecha_de_expiracion, administrador_id_aprobador) FROM stdin;
    public       postgres    false    199   zg       k          0    49966    kit_material 
   TABLE DATA               U   COPY public.kit_material (kit_id, material_id, num_elementos_requeridos) FROM stdin;
    public       postgres    false    200   �g       m          0    49971    material 
   TABLE DATA               U   COPY public.material (id, nombre, disponibles, ruta_imagen, descripcion) FROM stdin;
    public       postgres    false    202   �g       n          0    49978    material_categoria 
   TABLE DATA               G   COPY public.material_categoria (material_id, categoria_id) FROM stdin;
    public       postgres    false    203   �g       o          0    49981    material_subcategoria 
   TABLE DATA               M   COPY public.material_subcategoria (material_id, subcategoria_id) FROM stdin;
    public       postgres    false    204   �g       q          0    49986    perfil 
   TABLE DATA               9   COPY public.perfil (id, nombre, descripcion) FROM stdin;
    public       postgres    false    206   h       r          0    49990    prestamo 
   TABLE DATA               �   COPY public.prestamo (id, usuario_id, fecha_de_solicitud, fecha_de_aprobacion, administrador_id_aprobador, fecha_de_devolucion) FROM stdin;
    public       postgres    false    207   Xh       s          0    49994    prestamo_material 
   TABLE DATA               Z   COPY public.prestamo_material (prestamo_id, material_id, elementos_prestados) FROM stdin;
    public       postgres    false    208   uh       u          0    49999    subcategoria 
   TABLE DATA               M   COPY public.subcategoria (id, nombre, descripcion, categoria_id) FROM stdin;
    public       postgres    false    210   �h       w          0    50008    usuario 
   TABLE DATA               �   COPY public.usuario (id, nombre_completo, user_name, correo_ciencias, password, fecha_de_desbloqueo, ruta_imagen, validado) FROM stdin;
    public       postgres    false    212   �h       x          0    50016    usuario_perfil 
   TABLE DATA               ?   COPY public.usuario_perfil (usuario_id, perfil_id) FROM stdin;
    public       postgres    false    213   �h       �           0    0    categoria_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.categoria_seq', 1, false);
            public       postgres    false    196            �           0    0    material_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.material_seq', 1, false);
            public       postgres    false    201            �           0    0 
   perfil_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.perfil_seq', 2, true);
            public       postgres    false    205            �           0    0    prestamo_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.prestamo_seq', 1, false);
            public       postgres    false    214            �           0    0    subcategoria_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.subcategoria_seq', 1, false);
            public       postgres    false    209            �           0    0    usuario_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.usuario_seq', 1, false);
            public       postgres    false    211            �
           2606    50020    categoria primary 
   CONSTRAINT     Q   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT "primary" PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.categoria DROP CONSTRAINT "primary";
       public         postgres    false    197            �
           2606    50022    usuario primary1 
   CONSTRAINT     N   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT primary1 PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.usuario DROP CONSTRAINT primary1;
       public         postgres    false    212            �
           2606    50024    prestamo primary10 
   CONSTRAINT     P   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT primary10 PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT primary10;
       public         postgres    false    207            �
           2606    50026    prestamo_material primary11 
   CONSTRAINT     o   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT primary11 PRIMARY KEY (prestamo_id, material_id);
 E   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT primary11;
       public         postgres    false    208    208            �
           2606    50028    usuario_perfil primary12 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT primary12 PRIMARY KEY (usuario_id, perfil_id);
 B   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT primary12;
       public         postgres    false    213    213            �
           2606    50030    confirmacion primary2 
   CONSTRAINT     V   ALTER TABLE ONLY public.confirmacion
    ADD CONSTRAINT primary2 PRIMARY KEY (token);
 ?   ALTER TABLE ONLY public.confirmacion DROP CONSTRAINT primary2;
       public         postgres    false    198            �
           2606    50032    kit primary3 
   CONSTRAINT     J   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT primary3 PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT primary3;
       public         postgres    false    199            �
           2606    50034    material primary4 
   CONSTRAINT     O   ALTER TABLE ONLY public.material
    ADD CONSTRAINT primary4 PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.material DROP CONSTRAINT primary4;
       public         postgres    false    202            �
           2606    50036    kit_material primary5 
   CONSTRAINT     d   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT primary5 PRIMARY KEY (kit_id, material_id);
 ?   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT primary5;
       public         postgres    false    200    200            �
           2606    50038    material_categoria primary6 
   CONSTRAINT     p   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT primary6 PRIMARY KEY (material_id, categoria_id);
 E   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT primary6;
       public         postgres    false    203    203            �
           2606    50040    subcategoria primary7 
   CONSTRAINT     S   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT primary7 PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT primary7;
       public         postgres    false    210            �
           2606    50042    material_subcategoria primary8 
   CONSTRAINT     v   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT primary8 PRIMARY KEY (material_id, subcategoria_id);
 H   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT primary8;
       public         postgres    false    204    204            �
           2606    50044    perfil primary9 
   CONSTRAINT     M   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT primary9 PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.perfil DROP CONSTRAINT primary9;
       public         postgres    false    206            �
           1259    50045    correo_ciencias_unique    INDEX     \   CREATE UNIQUE INDEX correo_ciencias_unique ON public.usuario USING btree (correo_ciencias);
 *   DROP INDEX public.correo_ciencias_unique;
       public         postgres    false    212            �
           1259    50046    fk_categoria_idx    INDEX     Q   CREATE INDEX fk_categoria_idx ON public.subcategoria USING btree (categoria_id);
 $   DROP INDEX public.fk_categoria_idx;
       public         postgres    false    210            �
           1259    50047    fk_item_categoria_2_idx    INDEX     ^   CREATE INDEX fk_item_categoria_2_idx ON public.material_categoria USING btree (categoria_id);
 +   DROP INDEX public.fk_item_categoria_2_idx;
       public         postgres    false    203            �
           1259    50048    fk_item_subcategoria_2_idx    INDEX     g   CREATE INDEX fk_item_subcategoria_2_idx ON public.material_subcategoria USING btree (subcategoria_id);
 .   DROP INDEX public.fk_item_subcategoria_2_idx;
       public         postgres    false    204            �
           1259    50049    fk_kit_1_idx    INDEX     H   CREATE INDEX fk_kit_1_idx ON public.kit USING btree (usuario_id_autor);
     DROP INDEX public.fk_kit_1_idx;
       public         postgres    false    199            �
           1259    50050    fk_kit_2_idx    INDEX     R   CREATE INDEX fk_kit_2_idx ON public.kit USING btree (administrador_id_aprobador);
     DROP INDEX public.fk_kit_2_idx;
       public         postgres    false    199            �
           1259    50051    fk_kit_item_2_idx    INDEX     Q   CREATE INDEX fk_kit_item_2_idx ON public.kit_material USING btree (material_id);
 %   DROP INDEX public.fk_kit_item_2_idx;
       public         postgres    false    200            �
           1259    50052    fk_prestamo_1_idx    INDEX     L   CREATE INDEX fk_prestamo_1_idx ON public.prestamo USING btree (usuario_id);
 %   DROP INDEX public.fk_prestamo_1_idx;
       public         postgres    false    207            �
           1259    50053    fk_prestamo_2_idx    INDEX     \   CREATE INDEX fk_prestamo_2_idx ON public.prestamo USING btree (administrador_id_aprobador);
 %   DROP INDEX public.fk_prestamo_2_idx;
       public         postgres    false    207            �
           1259    50054    fk_prestamo_item_2_idx    INDEX     [   CREATE INDEX fk_prestamo_item_2_idx ON public.prestamo_material USING btree (material_id);
 *   DROP INDEX public.fk_prestamo_item_2_idx;
       public         postgres    false    208            �
           1259    50055    fk_usuario_perfil_1_idx    INDEX     W   CREATE INDEX fk_usuario_perfil_1_idx ON public.usuario_perfil USING btree (perfil_id);
 +   DROP INDEX public.fk_usuario_perfil_1_idx;
       public         postgres    false    213            �
           1259    50056    nombre_unique    INDEX     L   CREATE UNIQUE INDEX nombre_unique ON public.categoria USING btree (nombre);
 !   DROP INDEX public.nombre_unique;
       public         postgres    false    197            �
           1259    50057    nombre_unique1    INDEX     P   CREATE UNIQUE INDEX nombre_unique1 ON public.subcategoria USING btree (nombre);
 "   DROP INDEX public.nombre_unique1;
       public         postgres    false    210            �
           1259    50058    user_name_unique    INDEX     P   CREATE UNIQUE INDEX user_name_unique ON public.usuario USING btree (user_name);
 $   DROP INDEX public.user_name_unique;
       public         postgres    false    212            �
           1259    50059    usuario_id_unique    INDEX     W   CREATE UNIQUE INDEX usuario_id_unique ON public.confirmacion USING btree (usuario_id);
 %   DROP INDEX public.usuario_id_unique;
       public         postgres    false    198            �
           2606    50060    subcategoria fk_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 C   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT fk_categoria;
       public       postgres    false    2743    197    210            �
           2606    50065 &   material_categoria fk_item_categoria_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT fk_item_categoria_1 FOREIGN KEY (material_id) REFERENCES public.material(id);
 P   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT fk_item_categoria_1;
       public       postgres    false    202    2755    203            �
           2606    50070 &   material_categoria fk_item_categoria_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT fk_item_categoria_2 FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 P   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT fk_item_categoria_2;
       public       postgres    false    2743    203    197            �
           2606    50075 ,   material_subcategoria fk_item_subcategoria_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT fk_item_subcategoria_1 FOREIGN KEY (material_id) REFERENCES public.material(id);
 V   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT fk_item_subcategoria_1;
       public       postgres    false    204    2755    202            �
           2606    50080 ,   material_subcategoria fk_item_subcategoria_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT fk_item_subcategoria_2 FOREIGN KEY (subcategoria_id) REFERENCES public.subcategoria(id);
 V   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT fk_item_subcategoria_2;
       public       postgres    false    2774    210    204            �
           2606    50085    kit fk_kit_1    FK CONSTRAINT     v   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT fk_kit_1 FOREIGN KEY (usuario_id_autor) REFERENCES public.usuario(id);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT fk_kit_1;
       public       postgres    false    2777    199    212            �
           2606    50090    kit fk_kit_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT fk_kit_2 FOREIGN KEY (administrador_id_aprobador) REFERENCES public.usuario(id);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT fk_kit_2;
       public       postgres    false    199    2777    212            �
           2606    50095    kit_material fk_kit_item_1    FK CONSTRAINT     v   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT fk_kit_item_1 FOREIGN KEY (kit_id) REFERENCES public.kit(id);
 D   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT fk_kit_item_1;
       public       postgres    false    200    2750    199            �
           2606    50100    kit_material fk_kit_item_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT fk_kit_item_2 FOREIGN KEY (material_id) REFERENCES public.material(id);
 D   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT fk_kit_item_2;
       public       postgres    false    2755    200    202            �
           2606    50105    prestamo fk_prestamo_1    FK CONSTRAINT     z   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_1 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 @   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_prestamo_1;
       public       postgres    false    207    212    2777            �
           2606    50110    prestamo fk_prestamo_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_2 FOREIGN KEY (administrador_id_aprobador) REFERENCES public.usuario(id);
 @   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_prestamo_2;
       public       postgres    false    207    212    2777            �
           2606    50115 $   prestamo_material fk_prestamo_item_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT fk_prestamo_item_1 FOREIGN KEY (prestamo_id) REFERENCES public.prestamo(id);
 N   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT fk_prestamo_item_1;
       public       postgres    false    2767    207    208            �
           2606    50120 $   prestamo_material fk_prestamo_item_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT fk_prestamo_item_2 FOREIGN KEY (material_id) REFERENCES public.material(id);
 N   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT fk_prestamo_item_2;
       public       postgres    false    208    202    2755            �
           2606    50125    confirmacion fk_usuario_conf    FK CONSTRAINT     �   ALTER TABLE ONLY public.confirmacion
    ADD CONSTRAINT fk_usuario_conf FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 F   ALTER TABLE ONLY public.confirmacion DROP CONSTRAINT fk_usuario_conf;
       public       postgres    false    2777    198    212            �
           2606    50130 "   usuario_perfil fk_usuario_perfil_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT fk_usuario_perfil_1 FOREIGN KEY (perfil_id) REFERENCES public.perfil(id);
 L   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT fk_usuario_perfil_1;
       public       postgres    false    2763    213    206            �
           2606    50135 "   usuario_perfil fk_usuario_perfil_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT fk_usuario_perfil_2 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 L   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT fk_usuario_perfil_2;
       public       postgres    false    2777    212    213            h      x������ � �      i      x������ � �      j      x������ � �      k      x������ � �      m      x������ � �      n      x������ � �      o      x������ � �      q   =   x�3�(�OK-�/���QHI�Q(�
pq:��f�e�%� ���J�����D�=... ��      r      x������ � �      s      x������ � �      u      x������ � �      w      x������ � �      x      x������ � �     