<cfif Not IsDefined("variables.parseFileObj")>
	<cfset variables.parseFileObj = createObject("component", "parseFile") />
	testqqq
</cfif>

<h1>Hello World</h1>

<cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens"
returnvariable="myList" > 
		<cfset myFile = fileRead("c:\temp\test1.txt")>

    <cfdump  var="#myFile#">

<p>
	<cfoutput>
		#myList#
	</cfoutput>
	
</p>

<cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens"
returnvariable="myList" > 
	
<p>
	<cfoutput>
		#myList#
	</cfoutput>
</p>


<cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens"
returnvariable="myList" > 
	
<p>
	<cfoutput>
		#myList#
	</cfoutput>
</p>
<cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens"
returnvariable="myList" > 
	
<p>
	<cfoutput>
		#myList#
	</cfoutput>
</p>