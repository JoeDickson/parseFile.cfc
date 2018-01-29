component displayname="parseFile" hint="Singleton instance class that is able to read the next line from a text file and return a List of Strings that represent each delimited token that it reads from the file" output="false" returnType = "any"
{

/**

* @fileData String containing file data. Required
* @fileExt String specifying the file extension. Optional if customDelimiter is passed in
* @customDelimiter String containg characters to use as the delimiter. Optional if fileExt passed in.
*/
	this.lineCount = 1;
  
  public any function getNextLineTokens(required string fileData, string fileExt = '', string customDelimiter = '') 
	 displayname="getNextLineTokens" description="The first call to a getNextLineTokens method of this new class would return a List of Strings that delimited token values. The second call would return the next row in the same file data. No lines left should return null." returnFormat="plain"
	{
  var EOL = #chr(10)#; 
  // var TAB = #chr(9)#; 
  // var CR = #chr(13)#; 
  // var QUOTE = #chr(34)#; 
  // var SQUOTE = #chr(39)#; 
  // var POUND = #chr(35)#; 
  // var COMMA = #chr(44)#; 
  if( fileExt EQ "" && customDelimiter EQ "" ){
    throw("Method requires file extension or Custom Delimter be passed in.");
    abort;
  }

  if(NOT len(customDelimiter)){ 
    switch(Lcase(fileExt)) {
      case "tab":
          var delimiter = #chr(9)#;
          break;
      case "csv":
          var delimiter = #chr(44)#;
          break;
      default: 
          var delimiter = " ";
    }
  } else delimiter = chr(Asc(customDelimiter));

  if(fileExt EQ "exe" || fileExt EQ "com"){
      throw(message="Invaid file type");
      abort;
  }

  try {
  	var totalRows = listlen(fileData,EOL);
    if(this.lineCount GT totalRows){
      return "null";
    } else {
      var line = ListGetAt(fileData, this.lineCount, chr(10));
      var listArray = ListToArray(line, delimiter ); 
      this.lineCount = this.lineCount + 1;
      return ArrayToList(listArray, ",");
    } 
  }
  catch(Expression exceptionVariable) {
    WriteOutput("<p>An Expression exception was thrown.</p>");
    WriteOutput("<p>#exceptionVariable.message#</p>");
  }
  catch(Security exceptionVariable) {
    WriteOutput("<p>A Security exception was thrown.</p>");
    WriteOutput("<p>#exceptionVariable.message#</p>");
  }

 } 
}