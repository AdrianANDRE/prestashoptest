*** Settings ***
Resource	squash_resources.resource
Library		squash_tf.TFParamService

*** Variables ***
${login}    toto@aol.com
${mdp}    Totototo!

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_2_SETUP}	Get Variable Value	${TEST 2 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_2_SETUP is not None	${__TEST_2_SETUP}

Test Teardown
	${__TEST_2_TEARDOWN}	Get Variable Value	${TEST 2 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_2_TEARDOWN is not None	${__TEST_2_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Test de connexion et déconnexion KO
		
	[Setup]	Test Setup

	Given je suis sur la page d'accueil
	When Je clique sur le bouton de connexion
	Then Une page de connexion s'ouvre avec un champ E-mail , Mot de passe ,un lien Mot de passe oublié ? , un bouton connexion et un lien Pas de compte ? Créez-en un
	When Je rempli les champs E-mail : ${login} et Mot de passe : ${mdp}
	And Je clique sur le bouton connexion de la fenêtre connexion
	Then Je suis redirigé vers l'accueil avec mon Nom et Prénom et une bouton Déconnexion dans le coin supérieur droit

	[Teardown]	Test Teardown