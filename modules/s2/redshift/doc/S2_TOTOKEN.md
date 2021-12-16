### S2_TOTOKEN

{{% bannerNote type="code" %}}
carto.S2_TOTOKEN(id)
{{%/ bannerNote %}}

**Description**

Returns the conversion of a S2 cell ID into a token (S2 cell hexified ID).

* `id`: `INT8` S2 cell ID.

**Return type**

`VARCHAR(MAX)`

{{% customSelector %}}
**Example**
{{%/ customSelector %}}

```sql
SELECT carto.S2_TOTOKEN(-8520148382826627072);
-- 89c25a3
```

