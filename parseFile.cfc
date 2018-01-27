component displayname="parseFile" hint="Singleton instance class that is able to read the next line from a text file and return a List of Strings that represent each delimited token that it reads from the file" output="true"
{
	
	this.lineCount = 1;
	public any function getNextLineTokens(fileData) 
	 displayname="getNextLineTokens" description="The first call to a getNextLineTokens method of this new class would return a List of Strings that delimited token values. The second call would return the next row in the same file data. No lines left should return null." returnFormat="plain"
	{
		var myFile = "";
		var line = "";
	
		line = ListGetAt(myFile, this.lineCount, chr(10));
		//fileClose(myFile);
		this.lineCount = this.lineCount + 1;
		return line;
		
	}

}