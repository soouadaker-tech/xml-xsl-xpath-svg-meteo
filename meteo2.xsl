<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:template match="/">
        
        <svg xmlns="http://www.w3.org/2000/svg"
            width="1200"
            height="600">
            
            <line x1="100" y1="60"
                x2="100" y2="500"
                stroke="blue"
                stroke-width="2"/>
            
            <line x1="100" y1="500"
                x2="1100" y2="500"
                stroke="blue"
                stroke-width="2"/>
            
            <text x="400"
                y="30"
                font-size="24"
                fill="blue">
                Histogramme des températures
            </text>
            
            <xsl:for-each select="meteo/mesure[@date='2006-01-01']/ville">
                
                <xsl:variable name="pos"
                    select="position()*120"/>
                
                <xsl:variable name="temp"
                    select="@temperature*10"/>
                
                <text x="{$pos}"
                    y="520"
                    fill="black">
                    <xsl:value-of select="@nom"/>
                </text>
                
                <rect x="{$pos}"
                    y="{500 - $temp}"
                    width="40"
                    height="{$temp}"
                    fill="orange"
                    stroke="blue">
                    
                    <animate
                        attributeName="height"
                        dur="3s"
                        values="0;{$temp};0"
                        repeatCount="indefinite"/>
                    
                    <animate
                        attributeName="y"
                        dur="3s"
                        values="500;{500 - $temp};500"
                        repeatCount="indefinite"/>
                    
                </rect>
                
                <text x="{$pos}"
                    y="{500 - $temp - 10}"
                    fill="red">
                    <xsl:value-of select="@temperature"/>
                </text>
                
            </xsl:for-each>
            
        </svg>
        
    </xsl:template>
    
</xsl:stylesheet>