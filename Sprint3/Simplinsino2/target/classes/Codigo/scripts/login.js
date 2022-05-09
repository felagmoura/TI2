//------------------------STICKY NAV-------------------------//

// When the user scrolls the page, execute myFunction
window.onscroll = function () { myFunction() };

// Get the navbar
var navbar = document.getElementById("navbar");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
    if (window.pageYOffset > sticky) {
        navbar.classList.add("sticky")
    }
    else {
        navbar.classList.remove("sticky");
    }
}

// ------------------------------------------------------------//


var db_cadastro = db.cadastros;
var usuarioLogado = {};
function initLoginApp() {
    usuarioLogadoJSON = sessionStorage.getItem('usuarioLogado');
    if (usuarioLogadoJSON) {
        usuarioLogado = JSON.parse(usuarioLogadoJSON);
    }
    var usuariosJSON = localStorage.getItem('db_cadastro');
    if (!usuariosJSON) {

        // Copia os dados iniciais para o banco de dados 
        db_cadastro = db.cadastros;

        // Salva os dados iniciais no local Storage convertendo-os para string antes
        localStorage.setItem('db_cadastro', JSON.stringify(db.cadastros));

        document.location.reload();
    }
    else {
        db_cadastro = JSON.parse(usuariosJSON);
    }
};

function loginUser(usuario, senha, cargo) {
    let id;
    if (cargo == "Aluno") {
        fetch(`http://localhost:6795/getLogin/${usuario}/${senha}`)
            .then((response) => response.json())
            .then((data) => {
                if (parseInt(data) > 0) {
                    id = parseInt(data);
                    fetch(`http://localhost:6795/searchAluno/${id}`)
                        .then((response) => response.json())
                        .then((data) => {
                            sessionStorage.setItem('usuarioLogado', JSON.stringify(data));
                            window.location.reload()
                        })
                    sessionStorage.setItem('cargo', cargo);
                }
            })
            .catch((error) => alert("Erro "));
    }
    else {
        fetch(`http://localhost:6795/getLoginProfessor/${usuario}/${senha}`)
            .then((response) => response.json())
            .then((data) => {
                if (parseInt(data) > 0) {
                    id = parseInt(data);
                    fetch(`http://localhost:6795/searchProfessor/${id}`)
                        .then((response) => response.json())
                        .then((data) => {
                            sessionStorage.setItem('usuarioLogado', JSON.stringify(data));
                            window.location.reload()
                        })
                    sessionStorage.setItem('cargo', cargo);
                }
            })
            .catch((error) => alert("Erro "));
    }
}

function trocaBotoes() {
    let dbUsuarios = JSON.parse(sessionStorage.getItem('usuarioLogado'))
    let btnsLogado = document.getElementById("btns-Logado");
    let btnsNaoLogado = document.getElementById("btns-naoLogado");
    let cargo = sessionStorage.getItem('cargo');
    let htmlStr = ''

    if (!dbUsuarios) {
        btnsLogado.style.display = "none";
    }
    else if (cargo == "Aluno"){
        btnsNaoLogado.style.display = "none";

        htmlStr +=
            `
            <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        ${dbUsuarios[0].nome_aluno}
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="meus-cursos.html">meus cursos</a></li>
                        <li><a class="dropdown-item" href="tarefas.html">meus estudos</a></li>
                        <li><a class="dropdown-item" href="edicao-perfil.html">editar meu perfil</a></li>
                        <li><button class="dropdown-item" href="#" id="btnLogoff" onclick="LogoutUser()">sair</button></li>
                      </ul>
            `
        }
        else if (cargo == "Professor") {
            btnsNaoLogado.style.display = "none";

        htmlStr +=
            `
            <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        ${dbUsuarios[0].nome_professor}
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" id="cadastraCurso" href="cadastroCurso.html">cadastrar cursos</a></li>
                        <li><a class="dropdown-item" href="meus-cursos.html">meus cursos</a></li>
                        <li><a class="dropdown-item" href="tarefas.html">meus estudos</a></li>
                        <li><a class="dropdown-item" href="edicao-perfil.html">editar meu perfil</a></li>
                        <li><button class="dropdown-item" href="#" id="btnLogoff" onclick="LogoutUser()">sair</button></li>
                      </ul>
            `
        }
        btnsLogado.innerHTML = htmlStr

}

function LogoutUser() {
    sessionStorage.removeItem('usuarioLogado');
    sessionStorage.removeItem('cargo');
    //alert('Log off concluido')
    document.location.reload();
}

initLoginApp();

function processaFormLogin(event) {
    event.preventDefault();
    var username = document.getElementById('loginUsuario').value;
    var password = document.getElementById('loginSenha').value;
    var cargo = document.getElementById('inputCargo').value;

    resultadoLogin = loginUser (username, password, cargo);
}

document.getElementById('login-form').addEventListener('submit', processaFormLogin);

function checarLogin() {
    let usuario = JSON.parse(sessionStorage.getItem('usuarioLogado'));
    if (!usuario) {
        window.location.href = 'index.html';
    }
}
