<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- ============================================================
         VMCP XSLT
         Transforms vmcp.xml into styled HTML using vmcp.css
         ============================================================ -->

    <!-- Output HTML -->
    <xsl:output method="html" indent="yes" />

    <!-- ===========================
         Root Template
         =========================== -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Vertical Mode Configuration Panel</title>
                <link rel="stylesheet" type="text/css" href="vmcp.css"/>
            </head>

            <body>
                <div class="container">

                    <!-- Header -->
                    <div class="header">
                        <h1>Vertical Mode Configuration Panel</h1>
                        <div class="subtitle">XML / XSLT Demonstration</div>
                    </div>

                    <!-- Render Panel -->
                    <xsl:apply-templates select="VMCP/Panel"/>

                    <!-- Render Modes -->
                    <xsl:apply-templates select="VMCP/Modes"/>

                    <!-- Render Transitions -->
                    <xsl:apply-templates select="VMCP/Transitions"/>

                </div>
            </body>
        </html>
    </xsl:template>

    <!-- ===========================
         PANEL SECTION
         =========================== -->
    <xsl:template match="Panel">
        <div class="section">
            <h2>Panel Configuration</h2>

            <!-- Altitude Selector -->
            <div class="subsection">
                <h3>Altitude Selector</h3>

                <ul>
                    <li>
                        <strong>Increment:</strong>
                        <xsl:value-of select="AltitudeSelector/Increment"/>
                    </li>
                    <li>
                        <strong>Supports Push:</strong>
                        <xsl:value-of select="AltitudeSelector/SupportsPush"/>
                    </li>
                    <li>
                        <strong>Supports Pull:</strong>
                        <xsl:value-of select="AltitudeSelector/SupportsPull"/>
                    </li>
                </ul>
            </div>


            <!-- V/S & FPA Selector -->
            <div class="subsection">
                <h3>V/S &amp; FPA Selector</h3>

                <ul>
                    <li>
                        <strong>V/S Range:</strong>
                        <xsl:value-of select="VSFPASelector/VSRange/Min"/> to
                        <xsl:value-of select="VSFPASelector/VSRange/Max"/> ft/min
                    </li>

                    <li>
                        <strong>FPA Range:</strong>
                        <xsl:value-of select="VSFPASelector/FPARange/Min"/> to
                        <xsl:value-of select="VSFPASelector/FPARange/Max"/>°
                    </li>

                    <li>
                        <strong>Supports Push:</strong>
                        <xsl:value-of select="VSFPASelector/SupportsPush"/>
                    </li>

                    <li>
                        <strong>Supports Pull:</strong>
                        <xsl:value-of select="VSFPASelector/SupportsPull"/>
                    </li>
                </ul>
            </div>


            <!-- Mode Controls -->
            <div class="subsection">
                <h3>Mode Controls</h3>

                <ul>
                    <li><strong>Supports OP CLB:</strong> <xsl:value-of select="ModeControls/SupportsOPCLB"/></li>
                    <li><strong>Supports OP DES:</strong> <xsl:value-of select="ModeControls/SupportsOPDES"/></li>
                    <li><strong>Supports Managed Modes:</strong> <xsl:value-of select="ModeControls/SupportsManagedModes"/></li>
                </ul>
            </div>


            <!-- Annunciation Display -->
            <div class="subsection">
                <h3>Annunciation Display</h3>

                <ul>
                    <li><strong>Shows Active Mode:</strong> <xsl:value-of select="AnnunciationDisplay/ShowsActiveMode"/></li>
                    <li><strong>Shows Armed Mode:</strong> <xsl:value-of select="AnnunciationDisplay/ShowsArmedMode"/></li>
                    <li><strong>Shows Target Values:</strong> <xsl:value-of select="AnnunciationDisplay/ShowsTargetValues"/></li>
                </ul>
            </div>


        </div>
    </xsl:template>

    <!-- ===========================
         MODES SECTION
         =========================== -->
    <xsl:template match="Modes">
        <div class="section">
            <h2>Vertical Modes</h2>

            <ul class="mode-list">
                <xsl:apply-templates select="Mode"/>
            </ul>
        </div>
    </xsl:template>

    <!-- Individual Mode Card -->
    <xsl:template match="Mode">
        <li class="mode-card">

            <div class="mode-card-header">
                <span class="mode-name">
                    <xsl:value-of select="@name"/>
                </span>

                <span class="mode-type">
                    <xsl:value-of select="@category"/>
                </span>
            </div>

            <div class="mode-description">
                <xsl:value-of select="normalize-space(Description)"/>
            </div>

            <div class="mode-engagement">
                <strong>Activation:</strong>
                <xsl:text> </xsl:text>
                <xsl:value-of select="normalize-space(Activation)"/>
            </div>

            <xsl:if test="Inputs">
                <div class="mode-inputs">
                    <strong>Inputs:</strong>
                    <ul>
                        <xsl:for-each select="Inputs/Input">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:if>

            <div class="mode-behavior">
                <strong>Behavior:</strong>
                <xsl:text> </xsl:text>
                <xsl:value-of select="normalize-space(Behavior)"/>
            </div>

        </li>
    </xsl:template>

    <!-- ===========================
         TRANSITIONS SECTION
         =========================== -->
    <xsl:template match="Transitions">
        <div class="section">
            <h2>Mode Transitions</h2>

            <table class="targets-table">
                <thead>
                    <tr>
                        <th>From</th>
                        <th>To</th>
                        <th>Trigger</th>
                    </tr>
                </thead>

                <tbody>
                    <xsl:apply-templates select="Transition"/>
                </tbody>
            </table>
        </div>
    </xsl:template>

    <!-- Individual Transition Row -->
    <xsl:template match="Transition">
        <tr>
            <td><xsl:value-of select="@from"/></td>
            <td><xsl:value-of select="@to"/></td>
            <td><xsl:value-of select="normalize-space(Trigger)"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
