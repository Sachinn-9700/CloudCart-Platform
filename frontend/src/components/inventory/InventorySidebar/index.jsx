import "./InventorySidebar.css";

export default function InventorySidebar({
  brands,
  brand,
  setBrand,
}) {
  return (
    <aside className="inventory-sidebar">

      <h3>Brands</h3>

      <select
        value={brand}
        onChange={(e) => setBrand(e.target.value)}
      >
        <option value="All">
          All Brands
        </option>

        {brands.map((item) => (
          <option
            key={item}
            value={item}
          >
            {item}
          </option>
        ))}

      </select>

    </aside>
  );
}