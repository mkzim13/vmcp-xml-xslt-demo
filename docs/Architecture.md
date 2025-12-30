# VMCP System Architecture

This document provides a high‑level overview of the architecture behind the Vertical Mode Control Panel (VMCP) XML/XSD/XSLT demonstration. It explains how the components relate to one another and how data flows through the system.

---

## 🧩 Overview

The VMCP project is built on a classic structured‑content pipeline:

```
XML → XSD → XSLT → HTML → CSS → Browser Rendering
```

Each layer has a distinct responsibility:

- **XML** defines the data.
- **XSD** validates the structure and enforces correctness.
- **XSLT** transforms the XML into HTML.
- **CSS** styles the HTML for readability and presentation.
- **Browser** renders the final output.

---

## 📄 XML Data Model

The XML file (`vmcp.xml`) is the authoritative source of truth. It contains:

- **Panel configuration**  
  Altitude selector, V/S–FPA selector, mode controls, annunciation display.

- **Vertical modes**  
  Each mode includes:
  - Description  
  - Activation logic  
  - Inputs  
  - Behavior  
  - Category and name attributes

- **Mode transitions**  
  Automatic and pilot‑initiated transitions between modes.

The XML is designed to be human‑readable and structurally clear, with narrative fields formatted using mixed content.

---

## 📐 XSD Schema

The schema (`vmcp.xsd`) enforces:

- Required structure  
- Element ordering  
- Allowed mode names (enumerations)  
- Mixed‑content support for narrative fields  
- Attribute requirements  
- Type restrictions (boolean, decimal, int)

This ensures that the XML remains consistent, predictable, and free of structural errors.

---

## 🔧 XSLT Transformation

The XSLT file (`vmcp.xsl`) converts the XML into a styled HTML document. It:

- Generates a clean layout with sections and subsections  
- Renders each mode as a “mode card”  
- Builds a transitions table  
- Applies CSS classes for styling  
- Normalizes whitespace in narrative fields  
- Produces semantic, accessible HTML

The XSLT is the “presentation logic” layer of the system.

---

## 🎨 CSS Styling

The CSS file (`vmcp.css`) provides:

- Layout and spacing  
- Typography  
- Color palette  
- Mode card styling  
- Table formatting  
- Section headers  
- Readability improvements

This layer gives the final output a polished, professional appearance.

---

## 🌐 Browser Rendering

When the XML is opened through a local web server, the browser:

1. Loads the XML  
2. Detects the `xml-stylesheet` processing instruction  
3. Applies the XSLT  
4. Loads the CSS  
5. Renders the final HTML page  

Firefox is recommended because it has strong native XSLT support.

---

## 🧭 Summary

The VMCP project demonstrates a complete structured‑content architecture:

- **XML** for data  
- **XSD** for validation  
- **XSLT** for transformation  
- **CSS** for styling  
- **Browser** for final rendering  

This architecture mirrors real‑world systems used in aviation, engineering, and technical documentation environments.
