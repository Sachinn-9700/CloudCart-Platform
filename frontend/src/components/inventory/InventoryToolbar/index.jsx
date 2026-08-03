import "./InventoryToolbar.css";

export default function InventoryToolbar({
  total,
  search,
  setSearch,
  sortBy,
  setSortBy,
}) {
  return (
    <div className="inventory-toolbar">

      <input
        type="text"
        placeholder="Search vehicle..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      <div className="toolbar-right">

        <span>{total} Vehicles</span>

        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value)}
        >
          <option value="newest">Newest</option>

          <option value="price-low">
            Price ↑
          </option>

          <option value="price-high">
            Price ↓
          </option>

          <option value="mileage">
            Mileage
          </option>

        </select>

      </div>

    </div>
  );
}