import "./BrandLogo.css";

export default function BrandLogo({ brand }) {
  return (
    <div className="brand-card">
      <h3>{brand.name}</h3>

      <p>{brand.country}</p>

      <span>{brand.category}</span>
    </div>
  );
}