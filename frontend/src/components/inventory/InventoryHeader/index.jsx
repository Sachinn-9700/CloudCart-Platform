import "./InventoryHeader.css";

export default function InventoryHeader({
  title,
  subtitle,
}) {
  return (
    <section className="inventory-header">

      <p className="inventory-subtitle">
        CloudCart Inventory
      </p>

      <h1 className="inventory-title">
        {title}
      </h1>

      <p className="inventory-description">
        {subtitle}
      </p>

    </section>
  );
}