# Automation priority: null
# Test case importance: High
*** Settings ***
Resource	squash_resources.resource
Library		squash_tf.TFParamService

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_8_SETUP}	Get Variable Value	${TEST 8 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_8_SETUP is not None	${__TEST_8_SETUP}

Test Teardown
	${__TEST_8_TEARDOWN}	Get Variable Value	${TEST 8 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_8_TEARDOWN is not None	${__TEST_8_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Place an order with 2 article , log on user : "user" $$
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