<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:param name="avgtemp"/>
<xsl:param name="avgpress"/>
<xsl:param name="sdtemp"/>
<xsl:param name="sdpress"/>
<xsl:param name="icon"/>

  <xsl:output method="html"/>

  <xsl:template match="/">
<xsl:param name="current"><xsl:value-of select="//currentweather"/></xsl:param>
    <html>
      <head><title>Weather at Carbondale</title>
<style type="text/css">

 td.x { 
 font-family: helvetica; font-size: 130%;
}

 td.big {
 font-family: helvetica; font-size: 143%;
}

 td {
 font-family: helvetica;
}

 th {
 font-weight: normal;
}

</style>
</head>
      <body bgcolor="f0ffff">   
	<h1><em> <font color="darkblue">Weather at Carbondale</font></em></h1>

<xsl:text disable-output-escaping="yes">
&lt;?
</xsl:text>
%longday=("Mon"=>"Monday","Tue"=>"Tuesday","Wed"=>"Wednesday",
	  "Thu"=>"Thursday","Fri"=>"Friday","Sat"=>"Saturday","Sun"=>"Sunday");
@date = split(/\s+/,scalar localtime);
print '<font style="background:white"> Today is ';
print "$longday{$date[0]}, $date[1] $date[2] <br/>The time is now $date[3] <p/></font>";

<xsl:text disable-output-escaping="yes">
!&gt;
</xsl:text>
<table>
<tr>
<td align="left" class="x"><i>Current Weather: </i><img height="0" width="50"/>
 <b> <xsl:value-of select="$current"/></b></td>
<td><img src="WeathIcons/{$icon}"/>
</td></tr>
<tr><td>
<xsl:apply-templates select="Weather/*"/>
</td>
<td align="left" class="big">
<b>Twenty-Four Hour Summary</b><p/>
<dl>
<dt align="center">Temperature: &#x03bc; = <xsl:value-of select="$avgtemp"/>, 
&#x03c3; = <xsl:value-of select="$sdtemp"/></dt>
<p/>
<dt align="center">Pressure: &#x03bc; = <xsl:value-of select="$avgpress"/>,
&#x03c3; = <xsl:value-of select="$sdpress"/></dt>
</dl>
</td>
</tr>
<tr>
<td align="left"><img src="temp.png"/></td>
<td align="left"><img src="pres.png"/></td>
</tr>
</table>
<p/>
<hr/>
<p/>
<center>
 ------ 
<a href="forecast.html"> <b>CURRENT FORECAST</b> </a>
 ---------- 
<a href="http://www.crh.noaa.gov/radar/latest/DS.p19r0/si.kpah.shtml">
<b> CURRENT RADAR</b></a>
 ------ 
</center>
<p/>
<hr/>
<p/>
Data from 
<a href="http://weather.noaa.gov/weather/current/KMDH.html">
  <font color="darkblue">The National Weather Service.</font>
</a>
</body>
</html>
  </xsl:template>

<xsl:template match="Weather">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="Weather/Data">
<table bgcolor="ffffee">
<xsl:for-each select="*[name()!='currentweather']">
  <tr>
<td align="left" class="big">
      <xsl:value-of select="translate(name(),'_',' ')"/>: 
<xsl:text disable-output-escaping="yes">&amp;#160;</xsl:text>
<xsl:value-of select="(.)"/>
  </td>
</tr>
</xsl:for-each>
</table>
</xsl:template>

</xsl:stylesheet>
