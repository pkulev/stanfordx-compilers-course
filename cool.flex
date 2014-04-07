/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

%}

/*
 * Define names for regular expressions here.
 */

DARROW          =>
CLASS           [Cc][Ll][Aa][Ss][Ss]
INHERITS        [Ii][Nn][Hh][Ee][Rr][Ii][Tt][Ss]
THEN            [Tt][Hh][Ee][Nn]
ESAC            [Ee][Ss][Aa][Cc]
ELSE            [Ee][Ll][Ss][Ee]
WHILE          	[Ww][Hh][Ii][Ll][Ee]
IN          	[Ii][Nn]
FI          	[Ff][Ii]
POOL          	[Pp][Oo][Oo][Ll]
IF          	[Ii][Ff]
CASE          	[Cc][Aa][Ss][Ee]
NEW          	[Nn][Ee][Ww]
ISVOID          [Ii][Ss][Vv][Oo][Ii][Dd]
LET          	[Ll][Ee][Tt]
OF          	[Oo][Ff]
NOT          	[Nn][Oo][Tt]
LOOP          	[Ll][Oo][Oo][Pp]
TYPEID 		[A-Z][A-Za-z0-9_]*
OBJECTID	[a-z][A-Za-z0-9_]*

%%

 /*
  *  Nested comments
  */


 /*
  *  The multiple-character operators.
  */
{DARROW}		{ return (DARROW); }
{CLASS}                 { return (CLASS); }
{INHERITS}      	{ return (INHERITS); }
{THEN}          	{ return (THEN); }
{ESAC}          	{ return (ESAC); }
{ELSE}          	{ return (ELSE); }
{WHILE}         	{ return (WHILE); }
{IN}            	{ return (IN); }
{FI}            	{ return (FI); }
{POOL}          	{ return (POOL); }
{IF}            	{ return (IF); }
{CASE}          	{ return (CASE); }
"<="            	{ return (LE); }
{NEW}           	{ return (NEW); }
{ISVOID}        	{ return (ISVOID); }
{LET}           	{ return (LET); }
{OF}            	{ return (OF); }
{NOT}           	{ return (NOT); }
"<-"			{ return (ASSIGN); }
{LOOP}          	{ return (LOOP); }
\n                      { curr_lineno++; }
"."			{ return ('.'); }
";"			{ return (';'); }
"("			{ return ('('); }
")"			{ return (')'); }
":"			{ return (':'); }
","			{ return (','); }
"{"			{ return ('{'); }
"}"			{ return ('}'); }
"-"			{ return ('-'); }
"*"			{ return ('*'); }
"/"			{ return ('/'); }
"+"			{ return ('+'); }
"="			{ return ('='); }
"<"			{ return ('<'); }
"~"			{ return ('~'); }
"@"			{ return ('@'); }
t[Rr][Uu][Ee]		{ cool_yylval.boolean = true; 
			  return (BOOL_CONST); }
f[Aa][Ll][Ss][Ee]	{ cool_yylval.boolean = false;
			  return (BOOL_CONST); }
{TYPEID} {
	 cool_yylval.symbol = inttable.add_string(yytext);
	 return (TYPEID); }


.			


 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */


 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */


%%
