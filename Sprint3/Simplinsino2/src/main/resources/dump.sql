--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: ti2cc
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO ti2cc;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aluno; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.aluno (
    id_aluno integer NOT NULL,
    usuario_aluno character varying(50) NOT NULL,
    nome_aluno character varying(50) NOT NULL,
    email_aluno character varying(100) NOT NULL,
    pagamento_aluno character varying(50) NOT NULL,
    senha_aluno character varying(50) NOT NULL
);


ALTER TABLE public.aluno OWNER TO ti2cc;

--
-- Name: curso; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.curso (
    id_disciplinafk integer NOT NULL,
    id_curso integer NOT NULL,
    curso_nome character varying(100),
    curso_duracao character varying(45),
    curso_descricao character varying(500),
    curso_imagem character varying(300)
);


ALTER TABLE public.curso OWNER TO ti2cc;

--
-- Name: curso_aluno; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.curso_aluno (
    id_alunofk integer NOT NULL,
    id_cursofk integer NOT NULL
);


ALTER TABLE public.curso_aluno OWNER TO ti2cc;

--
-- Name: curso_professor; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.curso_professor (
    id_cursofk integer NOT NULL,
    id_professorfk integer NOT NULL
);


ALTER TABLE public.curso_professor OWNER TO ti2cc;

--
-- Name: curso_video; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.curso_video (
    id_cursofk integer NOT NULL,
    id_videofk integer NOT NULL
);


ALTER TABLE public.curso_video OWNER TO ti2cc;

--
-- Name: disciplina; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.disciplina (
    id_disciplina integer NOT NULL,
    disciplina_nome character varying(45),
    disciplina_img character varying(200)
);


ALTER TABLE public.disciplina OWNER TO ti2cc;

--
-- Name: disciplina_curso; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.disciplina_curso (
    id_disciplinafk integer NOT NULL,
    id_cursofk integer NOT NULL
);


ALTER TABLE public.disciplina_curso OWNER TO ti2cc;

--
-- Name: id-produto; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public."id-produto"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000
    CACHE 1;


ALTER TABLE public."id-produto" OWNER TO ti2cc;

--
-- Name: id-tarefa; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public."id-tarefa"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000
    CACHE 1;


ALTER TABLE public."id-tarefa" OWNER TO ti2cc;

--
-- Name: links_confiaveis; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.links_confiaveis (
    id_disciplinafk integer NOT NULL,
    "id_siteConfiavel" integer NOT NULL,
    nome_site character varying(50),
    url character varying(200)
);


ALTER TABLE public.links_confiaveis OWNER TO ti2cc;

--
-- Name: moderador; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.moderador (
    id_moderador integer NOT NULL,
    email_moderador character varying(50),
    usuario_moderador character varying(50),
    senha_moderador character varying(50)
);


ALTER TABLE public.moderador OWNER TO ti2cc;

--
-- Name: professor; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.professor (
    id_professor integer NOT NULL,
    nome_professor character varying(50) NOT NULL,
    usuario_professor character varying(50) NOT NULL,
    email_professor character varying(100) NOT NULL,
    senha_professor character varying(50) NOT NULL
);


ALTER TABLE public.professor OWNER TO ti2cc;

--
-- Name: professor_moderador; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.professor_moderador (
    id_moderadorfk integer NOT NULL,
    id_professorfk integer NOT NULL
);


ALTER TABLE public.professor_moderador OWNER TO ti2cc;

--
-- Name: tarefa; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.tarefa (
    id_tarefa integer DEFAULT nextval('public."id-tarefa"'::regclass) NOT NULL,
    tarefa_nome character varying(50),
    tarefa_prioridade integer,
    id_alunofk integer NOT NULL
);


ALTER TABLE public.tarefa OWNER TO ti2cc;

--
-- Name: video; Type: TABLE; Schema: public; Owner: ti2cc
--

CREATE TABLE public.video (
    id_video integer NOT NULL,
    link_video character varying(250) NOT NULL,
    descricao_video character varying(500) NOT NULL,
    nome_video character varying(200) NOT NULL,
    id_cursofk integer NOT NULL
);


ALTER TABLE public.video OWNER TO ti2cc;

--
-- Name: video_descricao_video_seq; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public.video_descricao_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_descricao_video_seq OWNER TO ti2cc;

--
-- Name: video_descricao_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ti2cc
--

ALTER SEQUENCE public.video_descricao_video_seq OWNED BY public.video.descricao_video;


--
-- Name: video_id_video_seq; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_video_seq OWNER TO ti2cc;

--
-- Name: video_id_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ti2cc
--

ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;


--
-- Name: video_link_video_seq; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public.video_link_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_link_video_seq OWNER TO ti2cc;

--
-- Name: video_link_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ti2cc
--

ALTER SEQUENCE public.video_link_video_seq OWNED BY public.video.link_video;


--
-- Name: video_nome_video_seq; Type: SEQUENCE; Schema: public; Owner: ti2cc
--

CREATE SEQUENCE public.video_nome_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_nome_video_seq OWNER TO ti2cc;

--
-- Name: video_nome_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ti2cc
--

ALTER SEQUENCE public.video_nome_video_seq OWNED BY public.video.nome_video;


--
-- Name: video id_video; Type: DEFAULT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);


--
-- Name: video link_video; Type: DEFAULT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video ALTER COLUMN link_video SET DEFAULT nextval('public.video_link_video_seq'::regclass);


--
-- Name: video descricao_video; Type: DEFAULT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video ALTER COLUMN descricao_video SET DEFAULT nextval('public.video_descricao_video_seq'::regclass);


--
-- Name: video nome_video; Type: DEFAULT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video ALTER COLUMN nome_video SET DEFAULT nextval('public.video_nome_video_seq'::regclass);


--
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.aluno (id_aluno, usuario_aluno, nome_aluno, email_aluno, pagamento_aluno, senha_aluno) FROM stdin;
1	asdf	asdf	asdf	asdf	asdf
2	pedro	pedro	pedro@pedro	1	1
\.


--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.curso (id_disciplinafk, id_curso, curso_nome, curso_duracao, curso_descricao, curso_imagem) FROM stdin;
0	0	Trigonometria	2 Horas	Nesse curso do canal Equaciona com Paulo Pereira, voc?? vai refor??ar seu conhecimento de da rela????o entre os lados e os ??ngulos de um tri??ngulo	https://static.mundoeducacao.uol.com.br/mundoeducacao/conteudo_legenda/26b68a819c16e1c96482e1353f34961d.jpg
0	1	??lgebra	2 Horas	Com a ajuda do professor Paulo Pereira voc?? vai lapidar o seu conhecimento de equa????es, opera????es matem??ticas, polin??mios e estruturas alg??bricas.	https://cdn.wizard.com.br/wp-content/uploads/2016/05/18172126/numeros-em-ingl%C3%AAs.jpg
0	2	Logaritimo	2 Horas	Se voc?? ?? daqueles alunos que t??m dificuldade com logaritmo, assista a esse curso do professor Paulo Pereira, ele vai te ajudar a entender tudo de logaritmo\n	https://www.mathdoubts.com/pics/log/system/natural.png
1	3	Citologia	2 Horas	Nesse curso, o professor Samuel Cunha, do canal Biologia com Samuel Cunha, vai te ensinar tudo sobre a estrutura e fun????o de uma c??lula\n	https://escolaeducacao.com.br/wp-content/uploads/2020/04/celulas-750x430.jpg
1	4	Bot??nica	2 Horas	O professor Kennedy Ramos vai te ensinar as caracter??sticas, a reprodu????o e o metabolismo dos principais grupos de planta\n	https://static.biologianet.com/conteudo/images/o-esporofito-das-briofitas-constituido-por-uma-haste-uma-capsula-cresce-sobre-gametofito-5981ae45aa880.jpg\n
2	5	Qu??mica Geral	2 Horas	Assista essas aulas sobre o estudo do ??tomo, as liga????es qu??micas, o estado f??sico da mat??ria e a separa????o de misturas montadas pelo professor Marcos no canal do Kennedy Ramos	https://s1.static.brasilescola.uol.com.br/be/conteudo/images/a-quimica-oferece-conhecimentos-muito-importantes-para-desenvolvimento-nossa-sociedade-562fd9fc8296e.jpg
2	6	Qu??mica Org??nica	2 Horas	O curso de qu??mica org??nica do do canal Qu??mica com Prof. Paulo Valim vai te apresentar ao estudo de todos os compostos que t??m em sua base a estrutura de ??tomos de carbono e outros elementos presentes nos organismos vivos	https://s1.static.brasilescola.uol.com.br/be/conteudo/images/a-quimica-organica-estuda-grande-parte-dos-compostos-formados-pelo-carbono-58d3e3fdb364e.jpg
3	7	Cinem??tica	2 Horas	Entenda o ramo da F??sica que estuda os movimentos dos corpos e das part??culas nesse curso do professor Marcelo Boaro, do canal Professor Boaro	https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2017/07/fisica-mecanica-1.jpg
3	8	Eletrodin??mica	2 Horas	Nesse curso do professor Davi Oliveira, do canal F??sica 2.0 voc?? vai aprender mais sobre os fen??menos relacionados ??s causas e aos efeitos do movimento das cargas num circuito el??trico.	https://www.howitworksdaily.com/wp-content/uploads/2019/07/flash-113310_960_720.jpg
3	9	Magnetismo	2 Horas	Aprenda, com professor Rafael Irigoyen, do canal Pura F??sica, os fen??menos ligados ??s propriedades de subst??ncias que possuem for??a magn??tica.	https://cdn.britannica.com/s:575x450/41/190641-004-E1B4A003.jpg
4	10	Gram??tica\n	2 Horas	Aperfei??oe sua escrita nesse curso de gram??tica da professora Geisa, do canal Aprenderaulas.com	https://blog.educalar.com.br/wp-content/uploads/2017/10/gram%C3%A1tica-1.png
4	11	G??neros Textuais	2 Horas	Acompanhe a professora Pamba, do canal Reda????o e Gram??tica Zica, enquanto ela mostra as caracter??sticas de cada G??nero Textual	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTRsQGMGKW7PksrOl7b19sdHg6cdHeb8N7EO_k4GFTrSDbqFsLdn9AWNq2vlRnzppDDik&usqp=CAU
5	12	Revolu????o Francesa	2 Horas	O professor Stefano, do canal reVis??o, vai dissecar um dos movimentos revolucion??rios mais marcantes da hist??ria, com a ajuda dele, voc?? vai saber tudo sobre a Revolu????o Francesa	https://static.historiadomundo.com.br/2021/05/revolucao-francesa.jpg
5	13	Brasil Imperial	2 Horas	O professor Walter Solla, do canal Se Liga - Enem e Vestibulares, vai te ajudar a entender o per??odo da hist??ria do Brasil que veio logo depois da Independ??ncia do nosso pa??s	https://comunica.ufu.br/sites/comunica.ufu.br/files/conteudo/noticia/imagem_chamada_simplicio_rodrigues_de_sa.png
6	14	Geologia	2 Horas	Estude Geologia, a ci??ncia que estuda os processos que ocorrem no interior do globo terrestre e na sua superf??cie, com o professor Silvester, do canal Prof Silvester Geografia	http://mundodecursos.com.br/wp-content/uploads/2021/11/geologia.jpg
6	15	Geopol??tica	2 Horas	Venha aprender mais sobre rela????es internacionais, conflitos culturais e disputas territoriais com o professor Thiago Feitosa, do canal ProEnem - Enem 2021	https://www.estudopratico.com.br/wp-content/uploads/2014/08/geopolitica-1-1200x675.jpg
7	16	Ingl??s para Iniciantes	2 Horas	Nesse curso de ingl??s b??sico, feito pelo professor Julio, do canal EnglishBay, voc?? ser?? capaz de entender e utilizar express??es simples e fazer algumas perguntas b??sicas como as que envolvem informa????es pessoais.	https://cdn.wizard.com.br/wp-content/uploads/2020/06/03192344/palavras-em-ingles-britanico-e-ingles-americano-wizard.jpg
\.


--
-- Data for Name: curso_aluno; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.curso_aluno (id_alunofk, id_cursofk) FROM stdin;
1	2
\.


--
-- Data for Name: curso_professor; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.curso_professor (id_cursofk, id_professorfk) FROM stdin;
\.


--
-- Data for Name: curso_video; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.curso_video (id_cursofk, id_videofk) FROM stdin;
\.


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.disciplina (id_disciplina, disciplina_nome, disciplina_img) FROM stdin;
0	Matem??tica	https://i.ibb.co/6ZT7xDJ/materia-mat.png
1	Biologia	https://i.ibb.co/JtNxq7V/materia-bio.png
2	Qu??mica	https://i.ibb.co/1zpHnX6/materia-qui.png
3	F??sica	https://i.ibb.co/rkmB1mb/materia-fis.png
4	Portugu??s\n	https://i.ibb.co/9hb53nh/materia-pt.png
5	Hist??ria	https://i.ibb.co/HKJddh1/materia-hist.png
6	Geografia	https://i.ibb.co/9HyyCbX/materia-geo.png
7	Ingl??s	https://i.ibb.co/hsXQdRf/materia-eng.png
\.


--
-- Data for Name: disciplina_curso; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.disciplina_curso (id_disciplinafk, id_cursofk) FROM stdin;
\.


--
-- Data for Name: links_confiaveis; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.links_confiaveis (id_disciplinafk, "id_siteConfiavel", nome_site, url) FROM stdin;
0	0	Khan Academy	https://pt.khanacademy.org/
0	1	Mestres da Matem??tica	https://mestresdamatematica.com.br/
0	2	S?? Matem??tica	https://www.somatematica.com.br/
0	3	edX	https://www.edx.org/course/subject/math
1	0	Prof. Guilherme Goulart	https://www.youtube.com/c/BiologiaProfGuilherme/featured
1	1	Biologia Total	https://www.youtube.com/user/jubilut
1	2	Brasil Escola	https://brasilescola.uol.com.br/biologia
1	3	S?? Biologia	https://www.sobiologia.com.br/
2	0	Qu??mica Sem Segredos	http://quimicasemsegredos.com/
2	1	S?? Qu??mica	https://www.soquimica.com.br/
2	2	Brasil Escola	https://brasilescola.uol.com.br/quimica
2	3	Qu??mica On-line	https://quimicaonline.com.br/
3	0	Chama o F??sico	https://www.youtube.com/channel/UCHW95H66qwKrZVizKOk1BJA
3	1	S?? F??sica	https://www.sofisica.com.br/
3	2	Brasil Escola	https://brasilescola.uol.com.br/fisica
4	0	Jana Rabelo	https://www.youtube.com/c/JanaRabelo/featured
4	1	S?? Portugu??s	https://www.soportugues.com.br/
4	2	S?? Literatura	https://www.soliteratura.com.br/
4	3	Gram??tica On-line	https://gramaticaonline.com.br/
4	4	Professor Nolsen	https://www.youtube.com/c/ProfessorNoslen/featured
5	0	Hist??ria Online	https://www.youtube.com/c/Hist%C3%B3riaOnlineoficial/featured
5	1	Brasil Escola	https://brasilescola.uol.com.br/historiag
5	2	S?? Hist??ria	https://www.sohistoria.com.br/
5	3	Hist??ria do Mundo	https://www.historiadomundo.com.br/
6	0	Terra Negra	https://www.youtube.com/channel/UCbQ4CkszFFUju5XtFid-XWQ
6	1	S?? Geografia	https://www.sogeografia.com.br/
6	2	Brasil Escola	https://brasilescola.uol.com.br/geografia
6	3	The World Factbook	https://www.cia.gov/the-world-factbook/a
7	0	Cambridge English	https://www.cambridgeenglish.org/learning-english/
7	1	Brasil Escola	https://brasilescola.uol.com.br/ingles
7	3	Busuu	https://www.busuu.com/pt/register?learning=en
7	4	English in Brazil	https://www.youtube.com/user/carinafragozo
\.


--
-- Data for Name: moderador; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.moderador (id_moderador, email_moderador, usuario_moderador, senha_moderador) FROM stdin;
1	adm@adm	adm	adm@adm
\.


--
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.professor (id_professor, nome_professor, usuario_professor, email_professor, senha_professor) FROM stdin;
1	Ana Cristina Carvalho Alves	Ana Cristina Carvalho Alves	pedroaifail55@hotmail.com	1
\.


--
-- Data for Name: professor_moderador; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.professor_moderador (id_moderadorfk, id_professorfk) FROM stdin;
\.


--
-- Data for Name: tarefa; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.tarefa (id_tarefa, tarefa_nome, tarefa_prioridade, id_alunofk) FROM stdin;
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: ti2cc
--

COPY public.video (id_video, link_video, descricao_video, nome_video, id_cursofk) FROM stdin;
1	https://www.youtube.com/embed/LxHY-bj3pSU	Neste v??deo, o professor Paulo Pereira fala sobre os famosos arcos not??veis: 30??, 45?? e 60??. ?? importante saber de cor o seno, o cosseno e a tangente deles.	Arcos Not??veis	0
2	https://www.youtube.com/embed/X_HPmZ1eOaY	Neste v??deo, o professor Paulo Pereira fala sobre assuntos que s??o requisitos para se trabalhar com a trigonometria na circunfer??ncia.	Arcos: Medidas e Comprimento	0
4	https://www.youtube.com/embed/_I9_xvGU0xw	Este ?? o 2?? v??deo (m??dulo 2) do curso T??PICOS EM ??LGEBRA. <br> Fatora????o por evidencia????o <br> Fatora????o por agrupamento <br> Fatora????o por identifica????o <br> T??cnica de soma zero	Fatora????o	1
5	https://www.youtube.com/embed/jRGgMKILOv8	Neste v??deo, o professor Paulo Pereira trabalha com o conceito de fra????es alg??bricas.	Fra????es Alg??bricas	1
6	https://www.youtube.com/embed/m-N5aAiaM2Y	Neste v??deo, o Professor Paulo Pereira procura mostrar que um Logaritmo nada mais ?? do que um expoente e que ?? f??cil calcular um logaritmo.	No????o B??sica	2
7	https://www.youtube.com/embed/_I9_xvGU0xw	Neste v??deo, o Professor Paulo Pereira trabalha com  defini????o de logaritmos e calculo alguns logaritmos como exemplo. Ele mostra a condi????o de exist??ncia de um logaritmo e as decorr??ncias imediatas da defini????o de logaritmos.	Defini????o e Decorr??ncias da Defini????o	2
8	https://www.youtube.com/embed/sMUU3vJXBXA	Neste v??deo, o professor resolve alguns exerc??cios de logaritmos. Basicamente fazendo o c??lculo mentalmente e ora pela defini????o recaindo numa equa????o exponencial.	Exerc??cios #1	2
9	https://www.youtube.com/embed/Nw7DaHpTxmQ	Neste v??deo o Professor Paulo Pereira apresenta as principais propriedades operat??rias dos Logaritmos: Produto, Quociente, Pot??ncia (Peteleco) e ainda define o cologaritmo.	Propriedades Operat??rias	2
10	https://www.youtube.com/embed/N33jWXzV8RU	Aula de INTRODU????O ?? CITOLOGIA, com o professor Samuel Cunha.	Introdu????o ?? Citologia	3
11	https://www.youtube.com/embed/4IoiIUgpcnw	Neste v??deo voc?? vai entender a diferen??a entre c??lula eucarionte e procarionte!	C??lulas Eucariontes x Procariontes	3
12	https://www.youtube.com/embed/a_2cA294m-c	Aula sobre citologia, onde o professor Samuel Cunha diferencio com maiores detalhes os organismos unicelulares dos pluricelulares.	Organismos Unicelulares e Pluricelulares	3
13	https://www.youtube.com/embed/E9_1aDsj8Xk	Nessa v??deo aula o professor Kennedy Ramos introduz o estudo de BOT??NICA ou REINO VEGETAL.	Introdu????o ?? Bot??nica	4
14	https://www.youtube.com/embed/dZuUjNILt0M	Nessa v??deo aula o professor Kennedy Ramos fala das CARACTER??STICAS GERAIS REPRODU????O do Grupo BRI??FITA.	Bri??fitas	4
15	https://www.youtube.com/embed/ZnW8_rY4Iy4	Nessa v??deo aula o professor Kennedy Ramos fala sobre as caracter??sticas gerais das PTERID??FITAS para sua Escola, ENEM e vestibulares.	Pterid??fitas	4
16	https://www.youtube.com/embed/XDBwYrWFZU	Nessa aula o professor Marcos fala sobre os Conceitos Fundamentais na Qu??mica.	Introdu????o ?? Qu??mica	5
17	https://www.youtube.com/embed/qgo2fQiJdGQ	Nessa aula o professor Marcos fala sobre os Aspectos Macrosc??picos da mat??ria.	Aspectos Macrosc??picos	5
18	https://www.youtube.com/embed/3_0BlFlmK54	Nessa aula o professor Paulo Valim fala sobre o Carbono e suas Classifica????es.	O Carbono e suas Classifica????es	6
19	https://www.youtube.com/embed/OBpCjR-52FA	Nessa aula o professor Paulo Valim fala sobre a Representa????o das Cadeias Carb??nicas.	Representa????o das Cadeias Carb??nicas	6
20	https://www.youtube.com/embed/ZEhjIs57jQQ	Nessa aula o professor Paulo Valim fala sobre a Classifica????o das Cadeias Carb??nicas.	Classifica????o das Cadeias Carb??nicas	6
21	https://www.youtube.com/embed/FtLtDqE-VX0	Nessa aula o professor Boaro fala sobre Nota????o Cient??fica, Sistema Internacional(SI) e Ordem de Grandeza.	Nota????o Cient??fica	7
22	https://www.youtube.com/embed/a7RxDGo8Zks	Nessa aula o professor Boaro fala sobre os conceitos iniciais de cinem??tica.	Conceitos iniciais	7
23	https://www.youtube.com/embed/1szfg-VovbM	Nessa aula o professor Boaro fala sobre os conceitos de velocidade m??dia.	Velocidade M??dia	7
24	https://www.youtube.com/embed/jAl-EaUwKnc	Nesse v??deo o professor Davi Oliveira vai iniciar o Estudo da Eletrodin??mica, apresentando o conceito de Corrente el??trica e suas caracter??sticas.	Corrente El??trica	8
25	https://www.youtube.com/embed/lQA7Xe-TUAg	Nesse v??deo o professor Davi Oliveira vai dar continuidade ao estudo da eletrodin??mica explanando de forma te??rica e did??tica a Lei de OHM.	Lei de OHM	8
26	https://www.youtube.com/embed/mOnvIq9LxJw	Nesse v??deo o professor Davi Oliveira vai dar continuidade ao estudo da eletrodin??mica, explicando a teoria sobre a segunda lei de OHM (Resistividade) e trabalhando com exemplos b??sicos  e did??ticos.	2?? Lei de OHM	8
27	https://www.youtube.com/embed/h0dYRTYiKDY	Nessa aula o professor Rafael Irigoyen trabalha os seguintes conceitos: <br> - Propriedades dos im??s <br> - Campo magn??tico, linhas de indu????o e vetor campo magn??tico <br> - Campo magn??tico da Terra	Im??s e Campo Magn??tico	9
28	https://www.youtube.com/embed/QmP0HUNp3k8	Nessa aula o professor Rafael Irigoyen trabalha os seguintes conceitos: <br> - Experimento de Oersted <br> - Regra da m??o direita <br> - Campo magn??tico de um fio retil??neo <br> - Campo magn??tico de uma espira circular <br> - Campo magn??tico de um solen??ide	Campo Magn??tico da Corrente El??trica	9
29	https://www.youtube.com/embed/zqj4HHkr57Y	Nesse video a professora Geisa faz uma introdu????o ?? gram??tica: Ortografia, fon??tica e fonologia, morfologia, sintaxe, sem??ntica.	Introdu????o - Parte 1	10
30	https://www.youtube.com/embed/1I4-ac-qxl0	Nesse video a professora Geisa continua a aula de introdu????o ?? gram??tica.	Introdu????o - Parte 2	10
31	https://www.youtube.com/embed/DxjkmUzyJlA	Nesse video a professora Geisa trabalha o conceito de acentua????o gr??fica	Acentua????o Gr??fica	10
32	https://www.youtube.com/embed/J-MOSikttwo	Nesse video a professora Pamba trabalha a diferen??a entre g??nero textuais e tipos textuais	G??neros Textuais x Tipos Textuais	11
33	https://www.youtube.com/embed/EdyD6C1c58o	Nesse video a professora Pamba fala sobre as caracter??sticas de um texto narrativo	Texto Narrativo	11
0	https://www.youtube.com/embed/4sTUs4ll3dI	Neste v??deo, o professor Paulo Pereira trabalha com as defini????es sobre o tri??ngulo ret??ngulo e as raz??es trigonom??tricas nele definidas: seno, cosseno e tangente.\n	Raz??es Trigonom??tricas	0
3	https://www.youtube.com/embed/eoYndkEntk8	Este ?? o primeiro v??deo do curso T??PICOS EM ??LGEBRA. Neste v??deo, temos o m??dulo 1, que trata do <br> 1. O quadrado da soma <br> 2. O quadrado da diferen??a <br> 3. O produto da soma pela diferen??a <br> 4. O cubo da soma <br> 5. O cubo da diferen??a <br> 6. O produto de Stevin <br> 7. O quadrado do trin??mio <br> 8. As identidades de Warring	Produtos Not??veis	1
34	https://www.youtube.com/embed/ILfq-ZrKP8s	Nesse video a professora Pamba fala sobre as caracter??sticas de um texto descritivo	Texto Descritivo	11
36	https://www.youtube.com/embed/6ZhsbJ-RNCw	Nesse epis??dio o Stefano vai explicar quem foram os monarcas franceses relacionados ?? Revolu????o Francesa e o que eles fizeram de bom, ou ruim, durante seus reinados. E para aqueles que gostam de conflito fiquem atentos que tamb??m vai rolar umas tretas com a Inglaterra.	Lu??s XIV, Lu??s XV, Lu??s XVI e a Crise do Absolutismo Franc??s	12
38	https://www.youtube.com/embed/6DtCRcXxXzY	Os anos logo antes da revolu????o foram muito tensos, conforme a situa????o se provou insustent??vel e a fome bateu na porta a grande massa francesa, acuada como um gato, rugiu como le??es nunca antes vistos naquele pa??s.	Revolu????o Francesa, Inglaterra e a Independ??ncia dos EUA	12
39	https://www.youtube.com/embed/xC8Cou-o3OM	Uma forma de governar muito particular, se tratando de Am??rica Latina. O Brasil virou Imp??rio! Um per??odo que foi marcado por dois trutas e mil tretas.	Introdu????o	13
40	https://www.youtube.com/embed/CEuuVvLa64s	Uma aula maneir??ssima para voc?? compreender de vez como foi essa tal Independ??ncia do Brasil. Quais eram as tretas? Como isso se desenvolveu e vem se desenvolvendo at?? hoje.	Independ??ncia do Brasil	13
41	https://www.youtube.com/embed/t_VaHl2Aqrs	Aula sobre Primeiro Reinado.	Primeiro Reinado	13
43	https://www.youtube.com/embed/y0WA1-0MgLM	Nesta aula de geografia pro Enem, eu explico sobre a Escala Geol??gica. a Contagem do tempo das rochas na Geologia. As eras geol??gicas detalhadas para voc??.	Escala Geol??gica	14
44	https://www.youtube.com/embed/GicW3UpL6Mw	Nesta aula de Geografia pro Enem, o professor Silvester explica a teoria das Placas Tect??nicas e da Deriva Continental. Aquela Teoria do qual o planeta era unido num ??nico continente, chamado de Pangeia, e se transformou nos continentes antigos chamados Laur??sia e Gondwana, at?? que nesta separa????o, surgiram os atuais continentes!	Placas Tect??nicas e Deriva Continental	14
37	https://www.youtube.com/embed/6DtCRcXxXzY	Nesse epis??dio o Stefano vai explicar quem foram os monarcas franceses relacionados ?? Revolu????o Francesa e o que eles fizeram de bom, ou ruim, durante seus reinados. E para aqueles que gostam de conflito fiquem atentos que tamb??m vai rolar umas tretas com a Inglaterra.	Revolu????o Francesa, Inglaterra e a Independ??ncia dos EUA	12
45	https://www.youtube.com/embed/TG6ndUtyhW8	Nesta aula de Geografia pro Enem, o professor Silvester explica sobre os Tipos ou formas de relevo e a Estrutura Geol??gica, tamb??m chamada de Prov??ncias geol??gicas, que definem o modelamento do relevo. Falamos de Nucleos cristalinos Crat??nicos, Bacias Sedimentares e de Cintur??es orog??nicos Dobramentos antigos e modernos.	Tipos, Formas e Estrutura do Relevo	14
46	https://www.youtube.com/embed/0JLm5VuunNk	No v??deo de hoje, o professor Thiago Feitosa explica os detalhes do complicado conflito que come??ou em 2011 na S??ria. 	Guerra na S??ria	15
47	https://www.youtube.com/embed/MouspraOg50	O assunto de hoje na nossa s??rie sobre Geopol??tica Contempor??nea ?? sobre o BREXIT. O professor Thiago Feitosa vai te explicar tudo o que voc?? precisa saber sobre o processo de sa??da do Reino Unido da Uni??o Europeia.	Brexit	15
48	https://www.youtube.com/embed/VTOH5KfKQVI	Em mais um epis??dio da nossa s??rie sobre a geopol??tica do mundo contempor??neo, o professor Thiago Feitosa te explica tudo sobre a Guerra da Crimeia.	A Guerra da Crimeia	15
49	https://www.youtube.com/embed/prAINVhqreQ	No primeiro v??deo do nosso curso Aprenda Falando voc?? vai aprender como falar as primeiras frases que s??o ditas quando voc?? conhece e fala com algu??m pela primeira vez.	Cumprimentos, apresenta????es e despedidas	16
50	https://www.youtube.com/embed/Fx1H0rMv7Tc	Nesta aula voc?? aprender?? a perguntar e dizer sua idade, de onde voc?? ?? e o que voc?? faz.	idade, Nacionalidade e Ocupa????o	16
35	https://www.youtube.com/embed/au4CQeOOgHU	Nesse epis??dio nosso amigo Stefano vai apresentar brevemente uma parte do contexto social franc??s pr??-revolu????o. Afinal de contas o que ?? que estava acontecendo na Fran??a naquela ??poca? Quem eram as pessoas que moravam ali? O que as pessoas no poder estavam pensando e o que o povo pensava das pessoas que estavam no poder?	Absolutismo, Clero e a Revolu????o Francesa	12
51	https://www.youtube.com/embed/DgYgwqkGWbM	Nessa aula de gram??tica voc?? aprende como estruturar frases afirmativas b??sicas no Presente Simples com o Verbo To be e com os outros verbos.	A Estrutura B??sica da L??ngua Inglesa	16
\.


--
-- Name: id-produto; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public."id-produto"', 1, true);


--
-- Name: id-tarefa; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public."id-tarefa"', 6, true);


--
-- Name: video_descricao_video_seq; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public.video_descricao_video_seq', 1, true);


--
-- Name: video_id_video_seq; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public.video_id_video_seq', 1, true);


--
-- Name: video_link_video_seq; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public.video_link_video_seq', 1, true);


--
-- Name: video_nome_video_seq; Type: SEQUENCE SET; Schema: public; Owner: ti2cc
--

SELECT pg_catalog.setval('public.video_nome_video_seq', 1, true);


--
-- Name: curso Curso_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT "Curso_pkey" PRIMARY KEY (id_curso);


--
-- Name: disciplina Disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT "Disciplina_pkey" PRIMARY KEY (id_disciplina);


--
-- Name: aluno aluno_email_aluno_key; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_email_aluno_key UNIQUE (email_aluno);


--
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- Name: aluno aluno_usuario_aluno_key; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_usuario_aluno_key UNIQUE (usuario_aluno);


--
-- Name: curso_aluno cursoSalvo_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_aluno
    ADD CONSTRAINT "cursoSalvo_pkey" PRIMARY KEY (id_alunofk, id_cursofk);


--
-- Name: curso_aluno curso_aluno_id_alunofk_id_cursofk_key; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_aluno
    ADD CONSTRAINT curso_aluno_id_alunofk_id_cursofk_key UNIQUE (id_alunofk, id_cursofk);


--
-- Name: curso_professor curso_professor_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_professor
    ADD CONSTRAINT curso_professor_pkey PRIMARY KEY (id_cursofk, id_professorfk);


--
-- Name: curso_video curso_video_id_cursofk_id_videofk_key; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_video
    ADD CONSTRAINT curso_video_id_cursofk_id_videofk_key UNIQUE (id_cursofk, id_videofk);


--
-- Name: curso_video curso_video_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_video
    ADD CONSTRAINT curso_video_pkey PRIMARY KEY (id_cursofk, id_videofk);


--
-- Name: disciplina_curso disciplina_curso_id_disciplinafk_id_cursofk_key; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.disciplina_curso
    ADD CONSTRAINT disciplina_curso_id_disciplinafk_id_cursofk_key UNIQUE (id_disciplinafk, id_cursofk);


--
-- Name: disciplina_curso disciplina_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.disciplina_curso
    ADD CONSTRAINT disciplina_curso_pkey PRIMARY KEY (id_disciplinafk, id_cursofk);


--
-- Name: links_confiaveis links_confiaveis_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.links_confiaveis
    ADD CONSTRAINT links_confiaveis_pkey PRIMARY KEY (id_disciplinafk, "id_siteConfiavel");


--
-- Name: moderador moderador_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.moderador
    ADD CONSTRAINT moderador_pkey PRIMARY KEY (id_moderador);


--
-- Name: professor_moderador professor_moderador_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.professor_moderador
    ADD CONSTRAINT professor_moderador_pkey PRIMARY KEY (id_moderadorfk, id_professorfk);


--
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id_professor);


--
-- Name: tarefa tarefa_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT tarefa_pkey PRIMARY KEY (id_tarefa);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);


--
-- Name: curso Curso_id_disciplinaFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT "Curso_id_disciplinaFK_fkey" FOREIGN KEY (id_disciplinafk) REFERENCES public.disciplina(id_disciplina);


--
-- Name: curso_aluno curso_aluno_id_alunoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_aluno
    ADD CONSTRAINT "curso_aluno_id_alunoFK_fkey" FOREIGN KEY (id_alunofk) REFERENCES public.aluno(id_aluno);


--
-- Name: curso_aluno curso_aluno_id_cursoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_aluno
    ADD CONSTRAINT "curso_aluno_id_cursoFK_fkey" FOREIGN KEY (id_cursofk) REFERENCES public.curso(id_curso);


--
-- Name: curso_professor curso_professor_id_cursoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_professor
    ADD CONSTRAINT "curso_professor_id_cursoFK_fkey" FOREIGN KEY (id_cursofk) REFERENCES public.curso(id_curso);


--
-- Name: curso_professor curso_professor_id_professorFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_professor
    ADD CONSTRAINT "curso_professor_id_professorFK_fkey" FOREIGN KEY (id_professorfk) REFERENCES public.professor(id_professor);


--
-- Name: curso_video curso_video_id_cursoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_video
    ADD CONSTRAINT "curso_video_id_cursoFK_fkey" FOREIGN KEY (id_cursofk) REFERENCES public.curso(id_curso);


--
-- Name: curso_video curso_video_id_videoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.curso_video
    ADD CONSTRAINT "curso_video_id_videoFK_fkey" FOREIGN KEY (id_videofk) REFERENCES public.video(id_video);


--
-- Name: disciplina_curso disciplina_curso_id_cursofk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.disciplina_curso
    ADD CONSTRAINT disciplina_curso_id_cursofk_fkey FOREIGN KEY (id_cursofk) REFERENCES public.curso(id_curso);


--
-- Name: disciplina_curso disciplina_curso_id_disciplinafk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.disciplina_curso
    ADD CONSTRAINT disciplina_curso_id_disciplinafk_fkey FOREIGN KEY (id_disciplinafk) REFERENCES public.disciplina(id_disciplina);


--
-- Name: links_confiaveis links_confiaveis_id_disciplinaFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.links_confiaveis
    ADD CONSTRAINT "links_confiaveis_id_disciplinaFK_fkey" FOREIGN KEY (id_disciplinafk) REFERENCES public.disciplina(id_disciplina);


--
-- Name: professor_moderador professor_moderador_id_moderadorFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.professor_moderador
    ADD CONSTRAINT "professor_moderador_id_moderadorFK_fkey" FOREIGN KEY (id_moderadorfk) REFERENCES public.moderador(id_moderador);


--
-- Name: professor_moderador professor_moderador_id_professorFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.professor_moderador
    ADD CONSTRAINT "professor_moderador_id_professorFK_fkey" FOREIGN KEY (id_professorfk) REFERENCES public.professor(id_professor);


--
-- Name: tarefa tarefa_id_alunoFK_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT "tarefa_id_alunoFK_fkey" FOREIGN KEY (id_alunofk) REFERENCES public.aluno(id_aluno);


--
-- Name: video video_id_cursofk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ti2cc
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_id_cursofk_fkey FOREIGN KEY (id_cursofk) REFERENCES public.curso(id_curso);


--
-- PostgreSQL database dump complete
--

