# XML Schema Validation Guide

This document explains how to validate the VMCP XML file (`vmcp.xml`) against its schema (`vmcp.xsd`) using Visual Studio Code.

---

## 🧩 Why Validation Matters

Schema validation ensures:

- Structural correctness  
- Required elements are present  
- Elements appear in the correct order  
- Attributes are valid  
- Mode names match the allowed enumerations  
- Narrative fields support mixed content  

Validation helps maintain data integrity as the XML evolves.

---

## 🛠 Prerequisites

### Install the VS Code extension:
**XML Tools**  
Publisher: Red Hat

This extension provides:
- Schema validation  
- Autocomplete  
- Error highlighting  
- XML formatting  

---

## 📄 Step 1 — Add Schema Reference to XML

At the top of `vmcp.xml`, ensure this attribute is present in the root element:

```xml
<VMCP xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="vmcp.xsd">
```

This tells VS Code which schema to use.

---

## 🧪 Step 2 — Validate the XML

1. Open `vmcp.xml` in VS Code  
2. The XML Tools extension will automatically validate it  
3. Errors appear in the **Problems** panel  
4. Hover over an error to see details  
5. Fix the XML and save — validation updates instantly  

---

## 🧭 Common Validation Errors

### ❌ Missing required elements
Example:
```
Element 'Modes': Missing child element(s).
```

### ❌ Invalid mode name
Because the schema enforces enumerations:
```
Value 'OPCLB' is not allowed.
```

### ❌ Incorrect element order
XSD enforces sequence order.

### ❌ Missing attributes
Example:
```
Attribute 'name' is required.
```

### ❌ Type mismatch
Example:
```
Value 'abc' is not valid for type xs:int.
```

---

## ✔️ Successful Validation

When the XML is valid:

- No errors appear in the Problems panel  
- The XML Tools status bar shows “No validation errors”  
- The XML is ready for transformation and rendering  

---

## 🎯 Summary

Schema validation ensures that the VMCP XML remains:

- Correct  
- Consistent  
- Predictable  
- Professional  

This is a core skill in structured documentation and engineering workflows.
