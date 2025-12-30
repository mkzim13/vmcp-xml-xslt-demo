# XML → XSLT → HTML Transformation Pipeline

This document explains how the VMCP XML is transformed into a styled HTML document using XSLT and CSS. It provides a clear, step‑by‑step view of the transformation process.

---

## 🔄 Overview of the Pipeline

The transformation pipeline follows this sequence:

```
vmcp.xml
   ↓ (xml-stylesheet instruction)
vmcp.xsl
   ↓ (transformation)
HTML
   ↓ (styling)
vmcp.css
   ↓
Rendered output in browser
```

---

## 🧾 Step 1 — XML Source

The XML file (`vmcp.xml`) contains:

- Panel configuration  
- Vertical modes  
- Mode transitions  

It includes this processing instruction at the top:

```xml
<?xml-stylesheet type="text/xsl" href="vmcp.xsl"?>
```

This tells the browser to apply the XSLT file when rendering the XML.

---

## 🛠 Step 2 — XSLT Transformation

The XSLT file (`vmcp.xsl`) performs the following tasks:

### 1. Generates the HTML structure
It creates:

- `<html>`
- `<head>` (with CSS link)
- `<body>`
- `<div class="container">`

### 2. Applies templates to XML elements
Examples:

- `<Panel>` → Panel configuration section  
- `<Modes>` → Mode list  
- `<Mode>` → Mode card  
- `<Transitions>` → Transitions table  

### 3. Normalizes whitespace
Narrative fields like `<Description>` and `<Behavior>` use:

```xml
<xsl:value-of select="normalize-space(Description)"/>
```

This ensures clean, readable text.

### 4. Adds CSS classes
The XSLT assigns classes such as:

- `mode-card`
- `mode-card-header`
- `mode-name`
- `section`
- `targets-table`

These classes are defined in `vmcp.css`.

---

## 🎨 Step 3 — CSS Styling

The CSS file (`vmcp.css`) controls:

- Layout  
- Typography  
- Colors  
- Spacing  
- Mode card appearance  
- Table formatting  

This separation of concerns keeps the XSLT focused on structure, not styling.

---

## 🌐 Step 4 — Browser Rendering

When you open:

```
http://localhost:8000/vmcp.xml
```

Firefox:

1. Loads the XML  
2. Applies the XSLT  
3. Loads the CSS  
4. Renders the final HTML  

This produces a clean, readable, interactive documentation page.

---

## 🧭 Summary

The transformation pipeline demonstrates:

- Clean separation of data, structure, and presentation  
- Real‑world XML/XSLT/CSS integration  
- A maintainable, extensible documentation workflow  

This is the same pattern used in many engineering and aviation documentation systems.
