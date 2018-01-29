<h1>Hello World</h1>

<cfif IsDefined("url.fa") && url.fa IS "test">
  <cfinclude  template="test.cfm">
<cfelse>
  <cfif Not IsDefined("variables.parseFileObj")>
    <cfset variables.parseFileObj = createObject("component", "parseFile") />
  </cfif>
  <cfset myPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
  <cfset variables.fileData = fileRead("#GetDirectoryFromPath(GetCurrentTemplatePath())#test1.csv")>
  <cfset variables.fileExt=ListLast("test1.csv",".")>
  <cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
  </p>

  <cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
  </p>
  <cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
  </p>
  <cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
  </p>
  <cfinvoke component="#variables.parseFileObj#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
  </p>

</cfif>

