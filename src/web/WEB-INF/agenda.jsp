<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <title>STRATON</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="style/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="style/jquery.gritter.css">
        <link rel="stylesheet" type="text/css" href="style/lineicons.css">
        <link rel="stylesheet" type="text/css" href="style/style.css">
        <link rel="stylesheet" type="text/css" href="style/style-responsive.css">
        <link rel="stylesheet" type="text/css" href="style/Accueil.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/4FEF4FD4-202B-164C-A9EF-E2CEBA04C76B/main.js" charset="UTF-8"></script><script src="assets/js/Chart.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>td #input{border:none;}</style>
    </head>
    <body>

        <section id="container" >
            <header class="header black-bg" >
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <a href="accueiladmin.jsp" class="logo" style="font-family: Times New Roman ,fantasy;font-size:200%;font-style: normal;font-weight: bolder; "><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSTRATON</b></a>
                <div class="nav notify-row" id="top_menu">
                    <ul class="nav top-menu">
                        <li id="header_inbox_bar" class="dropdown" style="margin-left:800px"> <a data-toggle="dropdown"> <i class="fa fa-envelope" ></i> <span class="badge bg-theme">1</span> </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">Nouveaux messages !</p>
                                </li>
                                <sql:setDataSource var="bd" scope="request" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gestiondeprojet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC" user="root" password="" />
                                <sql:query var="resultat" dataSource="${bd}">select * from message where destination="${sessionUtilisateur}"</sql:query>
                                <c:forEach items="${resultat.rows}" var="data">
                                <li> <a href="messagerie">  <span class="subject"> <span class="from">${data.Source}</span> <span class="time"></span> </span> <span class="message"> ${data.contenu}</span> </a> </li>
                                </c:forEach>
                                <li> <a href="messagerie">Voir tout.</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="Connexion">Déconnexion</a></li>
                    </ul>
                </div>
            </header>
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <ul class="sidebar-menu" id="nav-accordion">
                        <p class="centered"><a href="accueiladmin.jsp"><img src="images/saad.png" alt="website template image" width="60" class="img-circle"></a></p>
                        <h5 class="centered">K.E Saad</h5>
                        <li class="mt"> <a  href="profile"> <i class="fa fa-drivers-license-o"></i> <span>Page Personnelle</span> </a> </li>
                        <li class="mt"> <a  href="utilisateur"> <i class="fa fa-user-plus"></i> <span>Utilisateur</span> </a> </li>
                        <li class="mt"> <a href="agenda"> <i class="fa fa-book"></i> <span>Projet</span> </a> </li>
                        <li class="mt"> <a  href="tachecolabadm"> <i class="fa fa-user-plus"></i> <span>Collaborateur</span> </a> </li>
                        <li class="mt"> <a  href="publicationadm"> <i class="fa fa-comments-o"></i> <span>Mur Actualite</span> </a> </li>
                        <li class="mt"> <a  href="messagerie"> <i class="fa fa-commenting-o"></i> <span>Messagerie</span> </a> </li>
                    </ul>
                </div>
            </aside>
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 main-chart">
                            <div class="card">
                                <h1 class="card-header text-center font-weight-bold text-uppercase py-4"><b>Projets</b></h1></br>
                                <div class="card-body">
                                    <div id="table" class="table-editable">
                                        <span class="table-add float-right mb-3 mr-2"><a href="ajouter" class="text-success"><i class="fa fa-plus fa-2x" aria-hidden="true"></i></a></span>
                                        <table class="table table-bordered table-responsive-md table-striped text-center">
                                            <tr>
                                                <th class="text-center">Nom du Projet</th>
                                                <th class="text-center">Chef du Projet</th>
                                                <th class="text-center">Date Debut</th>
                                                <th class="text-center">Date fin</th>
                                                <th class="text-center">Etat Avancement</th>
                                                <th class="text-center">Modifier</th>
                                                <th class="text-center">Supprimer</th>
                                            </tr>
                                            <sql:setDataSource var="bd" scope="request" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gestiondeprojet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC" user="root" password="" />
                                            <sql:query var="resultat" dataSource="${bd}">select * from agenda</sql:query>
                                            <c:forEach items="${resultat.rows}" var="data">
                                            <tr><form method="post" action="agenda">
                                                <input id="input" type="hidden" name="action" value="modifier">
                                                <input id="input" type="hidden" name="id" value="<c:out  value='${data.id_Agenda}'/>">
                                                <td class="pt-3-half" contenteditable="true"><input id="input" type="text" name="NomProjet" value="<c:out  value='${data.IdentProjet}'/>" ></td>
                                                <td class="pt-3-half" contenteditable="true"><input id="input" type="text" name="ChefProjet" value="<c:out  value='${data.ChefDeProjet}'/>" ></td>
                                                <td class="pt-3-half" contenteditable="true"><input id="input" type="text" name="DateDebut" value="<c:out  value='${data.DateDebutProjet}'/>" ></td>
                                                <td class="pt-3-half" contenteditable="true"><input id="input" type="text" name="DateFin" value="<c:out  value='${data.DateFinProjet}'/>" ></td>
                                                <td class="pt-3-half" contenteditable="true"><input id="input" type="number" name="EtatAvancement" value="<c:out  value='${data.EtatAvancement}'/>" >%</td>
                                                <td>
                                                    <span ><button type="submit" class="btn btn-danger btn-rounded btn-sm my-0" onclick='swal("Donnée Modifiée", {buttons: [true],});'>Modifier</button></span>
                                                </td></form>
                                                <td>
                                                    <span><a    class="btn btn-danger btn-rounded btn-sm my-0" onclick="return confirme('Voulez-vous vraiment supprimer ce message?');">Supprimer</a></span>
                                                    <script language="javascript"> 
                                                            function confirme( identifiant ) 
                                                            { 
                                                                    var confirmation = window.confirm( "Voulez vous vraiment supprimer cet enregistrement ?" ) ; 
                                                                    if( confirmation ) 
                                                                            { 
                                                                            window.location.href = "supprimer?id=<c:out  value='${data.id_Agenda}'/>" ; 
                                                                            } 
                                                            } 
                                                    </script>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
              
                                        </table>
                                        
                                </div>
                            </div>

                        </div>
                                               </div>
                </section>
            </section>
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>Copyright © K.E Saad</small>
                    </div>
                </div>
            </footer>
        </section>
        <div id="freecssfooter">
            <div id="fcssholder">
                <div id="bsap_2365" class="bsarocks bsap_b893e54e42ad5b76e7b252f59be18e67"></div>
                <div id="bsap_1635" class="bsarocks bsap_b893e54e42ad5b76e7b252f59be18e67"></div>
            </div>
    </body>
</html>
<script src="js/jquery.js"></script> 
<script src="js/jquery-1.8.3.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.dcjqaccordion.2.7.js" class="include"></script> 
<script src="js/jquery.scrollTo.min.js"></script> 
<script src="js/jquery.nicescroll.js"></script> 
<script src="js/jquery.sparkline.js"></script> 
<script src="js/common-scripts.js"></script> 
<script src="js/jquery.gritter.js"></script> 
<script src="js/gritter-conf.js"></script> 
<script src="js/sparkline-chart.js"></script> 
<script src="js/zabuto_calendar.js"></script> 

