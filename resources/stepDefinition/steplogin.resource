*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/pageObjects/home.resource
Resource    ../../resources/pageObjects/login.resource

*** Keywords ***

je suis sur la page d'accueil
    Check home page
Je clique sur le bouton de connexion
    Click button connexion home
Une page de connexion s'ouvre avec un champ E-mail , Mot de passe ,un lien Mot de passe oublié ? , un bouton connexion et un lien Pas de compte ? Créez-en un
    Check forgotPwdLink
    Check no accountLink
Je rempli les champs E-mail : ${login} et Mot de passe : ${mdp}
    Set email    toto@aol.com
    Set pwd    Totototo!
Je clique sur le bouton connexion de la fenêtre connexion
    Click button Connexion
Je suis redirigé vers l'accueil avec mon Nom et Prénom et une bouton Déconnexion dans le coin supérieur droit
    Check home page
    Check name home    test    Coucou
Je me connecte avec le login : "toto@aol.com" , mdp : "Totototo!"
    Click button connexion home
    Check forgotPwdLink
    Check no accountLink
    Set email    toto@aol.com
    Set pwd    Totototo!
    Click button Connexion
Je suis redirigé sur la page d'accueil , et le prénom nom : "test Coucou" est afficher sur la page
    Check home page
    Check name home    test    Coucou