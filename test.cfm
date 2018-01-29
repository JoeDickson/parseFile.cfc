<h1>Testing</h1>

 <cfif Not IsDefined("variables.parseFileObjtest1")> 
    <cfset variables.parseFileObjtest1 = createObject("component", "parseFile") />
  </cfif>
  <cfset myPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
  <cfset variables.fileData = fileRead("#GetDirectoryFromPath(GetCurrentTemplatePath())#test1.csv")>
  <cfset variables.fileExt=ListLast("test1.csv",".")>
  <cfinvoke component="#variables.parseFileObjtest1#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
      <cfif Not Compare(myList, "Hello,world,how,are,you,1")>
        <br />--Incorrect parsing
         <cfset variables.valid = false>
      </cfif>
    </cfoutput>
  </p>

  <cfset variables.valid = true>
  <cfinvoke component="#variables.parseFileObjtest1#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
     <cfif Not Compare(myList, "Hello,world,how,are,you,2")>
       <br />--Incorrect parsing
        <cfset variables.valid = false>
      </cfif>
  </p>
  
    <cfinvoke component="#variables.parseFileObjtest1#" method="getNextLineTokens" returnvariable="myList"> 
  <cfinvokeargument name="fileData" value="#variables.fileData#">
  <cfinvokeargument name="fileExt" value="#variables.fileExt#">
  </cfinvoke>
  <p>
    <cfoutput>
      #myList#
    </cfoutput>
   <cfif Not Compare(myList, "null")>
        <cfset variables.valid = false>
      </cfif>
  </p>

<cfif variables.valid>
  CSV Tests passed.
<cfelse>
  CSV Tests failed.
</cfif>


<cfif Not IsDefined("variables.parseFileObjtest2")>
  <cfset variables.parseFileObjtest2 = createObject("component", "parseFile") />
</cfif>
<cfset myPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
<cfset variables.fileData = fileRead("#GetDirectoryFromPath(GetCurrentTemplatePath())#test1.tab")>
<cfset variables.fileExt=ListLast("test1.tab",".")>
<cfinvoke component="#variables.parseFileObjtest2#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="fileExt" value="#variables.fileExt#">
</cfinvoke>
<p>
  <cfoutput>
    #myList#
    <cfif Not Compare(myList, "Hello,world,how,are,you,1")>
       <br />--Incorrect parsing
    </cfif>
  </cfoutput>
</p>

<cfset variables.valid = true>
<cfinvoke component="#variables.parseFileObjtest2#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="fileExt" value="#variables.fileExt#">
</cfinvoke>
<p>
  <cfoutput>
    #myList#
  </cfoutput>
    <cfif Not Compare(myList, "Hello,world,how,are,you,2")>
        <br />--Incorrect parsing
      <cfset variables.valid = false>
    </cfif>
</p>

<cfinvoke component="#variables.parseFileObjtest2#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="fileExt" value="#variables.fileExt#">
</cfinvoke>
<p>
  <cfoutput>
    #myList#
  </cfoutput>
  <cfif myList NEQ "null">
        <br />--Incorrect parsing
      <cfset variables.valid = false>
    </cfif>
</p>

<cfif variables.valid>
  TAB Tests passed.
<cfelse>
  TAB Tests failed.
</cfif>

<cfif Not IsDefined("variables.parseFileObjtest3")>
  <cfset variables.parseFileObjtest3 = createObject("component", "parseFile") />
</cfif>
<cfset myPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
<cfset variables.fileData = fileRead("#GetDirectoryFromPath(GetCurrentTemplatePath())#testCustom.txt")>
<cfset variables.fileExt=ListLast("testCustom.txt",".")>

<cfset variables.valid = true>
<cfinvoke component="#variables.parseFileObjtest3#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="customDelimiter" value="~">
</cfinvoke>
<p>
  <cfoutput>
    #myList#
     <cfif Not Compare(myList, "Hello,world,how,are,you,1")>
       <br />--Incorrect parsing
         <cfset variables.valid = false>
    </cfif>
  </cfoutput>
</p>

<cfset variables.valid = true>
<cfinvoke component="#variables.parseFileObjtest3#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="customDelimiter" value="?">
</cfinvoke>
<p>
  <cfoutput>
    #myList# #Compare(myList, "Hello,world,how,are,you,2")#
  </cfoutput>
      <cfif Not Compare(myList, "Hello,world,how,are,you,2", ",")>
      <br />--Incorrect parsing
      <cfset variables.valid = false>
    </cfif>
</p>

<cfinvoke component="#variables.parseFileObjtest3#" method="getNextLineTokens" returnvariable="myList"> 
<cfinvokeargument name="fileData" value="#variables.fileData#">
<cfinvokeargument name="customDelimiter" value="~">
</cfinvoke>
<p>
  <cfoutput>
    #myList#
  </cfoutput>
  <cfif myList NEQ "null">
      Incorrect parsing
      <cfset variables.valid = false>
    </cfif>
</p>

<cfif variables.valid>
Custom Tests passed.
<cfelse>
Custom Tests failed.
</cfif>