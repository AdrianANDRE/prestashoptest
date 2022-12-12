*** Settings ***
Resource    squash_resources.resource
*** Test Cases ***
Testing
    
	${row_1_1} =	Create List	Product	Number	Price
	${row_1_2} =	Create List	Affiche encadrée The best is yet to come	3	34,80
	${row_1_3} =	Create List	Illustration vectorielle Renard	2	10,80
	${datatable_1} =	Create List	${row_1_1}	${row_1_2}	${row_1_3}

    Log To Console    \n${datatable_1}