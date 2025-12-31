## Future Enhancements

The current XML/XSD model focuses on documenting the VMCP’s structure and behavior. Several enhancements could expand the model into a more dynamic or simulation‑oriented system.

### 1. Input Range Validation
The XML currently documents valid ranges (e.g., vertical speed limits) but does not enforce them. Future versions could:

- Add XSD constraints for numeric ranges
- Introduce a `<VerticalSpeed>` or `<SelectedValue>` element to validate
- Enforce min/max limits for V/S and FPA inputs

This would shift the model toward validating actual pilot‑entered values.

### 2. Annunciation Definitions
The XML describes what the annunciation display *can* show, but not the annunciations themselves. A future enhancement could add:

```xml
<Annunciations>
    <Annunciation name="ALT">
        <Meaning>Altitude Hold is active</Meaning>
    </Annunciation>
    <Annunciation name="ALT*">
        <Meaning>Altitude capture in progress</Meaning>
    </Annunciation>
    ...
</Annunciations>
```

This would allow the XSLT to generate a full annunciation reference table.

### 3. Annunciation Logic Modeling
A more advanced extension could define when annunciations appear:

```xml
<AnnunciationLogic>
    <Rule mode="VS" annunciation="VS" state="active"/>
    <Rule mode="ALT*" annunciation="ALT*" state="active"/>
    <Rule mode="ALT" annunciation="ALT" state="active"/>
</AnnunciationLogic>
```

This would bring the model closer to a state machine.

### 4. Runtime State Representation
To simulate the VMCP during a flight scenario, the XML could include:

```xml
<CurrentState>
    <ActiveMode>VS</ActiveMode>
    <ArmedMode>ALT*</ArmedMode>
    <SelectedAltitude>18000</SelectedAltitude>
    <SelectedVS>+1800</SelectedVS>
</CurrentState>
```

This would enable:

- Real‑time validation
- Scenario playback
- More advanced XSLT visualizations

### 5. Automated Validation Workflows
A GitHub Actions workflow could automatically:

- Validate XML against the XSD on every commit
- Run negative tests to ensure schema robustness
- Generate documentation artifacts from the XML

This would add CI/CD‑style quality assurance to the project.

---

These enhancements are optional, but they outline a clear roadmap for evolving the VMCP model from a documentation artifact into a richer, more dynamic system representation.
