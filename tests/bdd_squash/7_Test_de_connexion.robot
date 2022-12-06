# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_7_SETUP}	Get Variable Value	${TEST 7 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_7_SETUP is not None	${__TEST_7_SETUP}

Test Teardown
	${__TEST_7_TEARDOWN}	Get Variable Value	${TEST 7 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_7_TEARDOWN is not None	${__TEST_7_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Test de connexion
	[Setup]	Test Setup

	Given je suis sur la page d'accueil
	When Je me connecte avec le login : "toto@aol.com" , mdp : "Totototo!"
	Then Je suis redirigé sur la page d'accueil , et le prénom nom : "test Coucou" est afficher sur la page

	[Teardown]	Test Teardown