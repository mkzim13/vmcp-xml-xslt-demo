# VMCP XML Schema Validation Test Plan
This test plan verifies that `vmcp.xml` conforms to the structural and semantic rules defined in `vmcp.xsd`. It includes positive validation tests, negative tests, boundary tests, and structural integrity checks.

---

## 1. Objectives
- Ensure the XML instance (`vmcp.xml`) is valid against the schema (`vmcp.xsd`)
- Verify that all required elements and attributes are present
- Confirm that enumerations, data types, and constraints are enforced
- Validate that invalid XML is correctly rejected
- Provide confidence that the data model is stable and well‑formed

---

## 2. Tools Required
- Visual Studio Code with XML Tools extension  
- Or any XML validator supporting XSD (e.g., Oxygen XML, xmllint, IntelliJ XML plugin)

---

## 3. Test Categories

### 3.1 Positive Validation Tests
These tests confirm that correct XML passes validation.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| P‑01 | Validate `vmcp.xml` with no changes | XML is valid |
| P‑02 | Add whitespace, comments, or formatting changes | XML remains valid |
| P‑03 | Reorder sibling elements where order is not constrained | XML remains valid |
| P‑04 | Add additional `<Mode>` elements with valid structure | XML remains valid |
| P‑05 | Add additional `<Transition>` elements with valid attributes | XML remains valid |

---

### 3.2 Required Element Tests
These tests ensure the schema enforces mandatory structure.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| R‑01 | Remove `<Panel>` entirely | Validation fails |
| R‑02 | Remove `<Modes>` | Validation fails |
| R‑03 | Remove `<Transitions>` | Validation fails |
| R‑04 | Remove required child (e.g., `<Description>` inside a `<Mode>`) | Validation fails |
| R‑05 | Remove required attributes (`name`, `category`) from `<Mode>` | Validation fails |

---

### 3.3 Enumeration & Attribute Tests
Ensures attributes accept only allowed values.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| A‑01 | Change `category="Selected"` to `category="Manual"` | Validation fails |
| A‑02 | Change `name="VS"` to `name="VSS"` | Validation fails |
| A‑03 | Add an undefined attribute to `<Mode>` | Validation fails |
| A‑04 | Set `SupportsPush` to a non‑boolean value (`yes`) | Validation fails |

---

### 3.4 Data Type & Range Tests
Ensures numeric and boolean types are enforced.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| D‑01 | Set `<Min>` to a string (`abc`) | Validation fails |
| D‑02 | Set `<Max>` to a float where integer is required | Validation fails |
| D‑03 | Set `<SupportsPull>` to `1` | Validation fails |
| D‑04 | Set `<Increment>` to a negative number | Validation fails (if schema restricts) |

---

### 3.5 Structural Integrity Tests
Ensures the hierarchy is correct.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| S‑01 | Move `<Mode>` outside `<Modes>` | Validation fails |
| S‑02 | Place `<Transition>` inside `<Mode>` | Validation fails |
| S‑03 | Nest `<Mode>` inside another `<Mode>` | Validation fails |
| S‑04 | Add unexpected elements (e.g., `<Foo>`) | Validation fails |

---

### 3.6 Transition Logic Tests
Ensures transitions reference valid mode names.

| Test ID | Description | Expected Result |
|--------|-------------|----------------|
| T‑01 | Set `from="XYZ"` where XYZ is not a defined mode | Validation fails |
| T‑02 | Set `to="ALTITUDE"` | Validation fails |
| T‑03 | Remove `from` attribute | Validation fails |
| T‑04 | Remove `to` attribute | Validation fails |

---

## 4. Validation Procedure

1. Open `vmcp.xml` in VS Code  
2. Ensure the schema reference is correct:  
   ```xml
   xsi:noNamespaceSchemaLocation="xml/schema/vmcp.xsd"
   ```
3. Make one change per test case  
4. Save the file  
5. Run **XML Tools → Validate XML**  
6. Record pass/fail result  
7. Revert the change before moving to the next test

---

## 5. Acceptance Criteria
The XML is considered valid if:

- All **positive tests** pass  
- All **negative tests** fail as expected  
- No unexpected validation errors occur  
- The schema correctly enforces structure, types, and enumerations  

---

## 6. Summary
This test plan ensures that the VMCP XML model is:

- Well‑formed  
- Schema‑compliant  
- Robust against invalid data  
- Suitable for transformation and documentation workflows  
