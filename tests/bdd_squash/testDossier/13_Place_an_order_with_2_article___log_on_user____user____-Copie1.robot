# Automation priority: null
# Test case importance: High
*** Settings ***
Resource	squash_resources.resource
Library		squash_tf.TFParamService

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_13_SETUP}	Get Variable Value	${TEST 13 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_13_SETUP is not None	${__TEST_13_SETUP}

Test Teardown
	${__TEST_13_TEARDOWN}	Get Variable Value	${TEST 13 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_13_TEARDOWN is not None	${__TEST_13_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Place an order with 2 article , log on user : "user" $$-Copie1
	${alias} =	Get Test Param	DS_alias
	${company} =	Get Test Param	DS_company
	${tva} =	Get Test Param	DS_tva
	${adress} =	Get Test Param	DS_adress
	${supp} =	Get Test Param	DS_supp
	${zip} =	Get Test Param	DS_zip
	${city} =	Get Test Param	DS_city
	${country} =	Get Test Param	DS_country
	${phone} =	Get Test Param	DS_phone
	${paymode} =	Get Test Param	DS_paymode

	[Setup]	Test Setup

	Given i'm log as user : "coucou"
	When i add "2" random articles in the cart
	Then There is those "2" articles in the cart with the correct total price
	When i initiate placing order process
	And I fill command form with alias ${alias} company ${company} tva ${tva} address ${adress} supp ${supp} zip ${zip} city ${city} country ${country} phone ${phone} and facturation "check" and submit
	And i choose delivery "Click and collect"
	And i pay by paymode ${paymode} and choose approveSalesConditions "check"
	And i submit order
	Then i have a confirmation message on my order

	[Teardown]	Test Teardown