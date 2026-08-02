import "./BrandShowcase.css";

import brands from "../../../data/catalog/brands";

import BrandLogo from "../BrandLogo";

export default function BrandShowcase() {
  return (
    <section className="brand-showcase">

      <div className="section-heading">

        <p>Trusted Brands</p>

        <h2>
          We Curate The World's Finest
          <br />
          Automotive Icons
        </h2>

      </div>

      <div className="brand-grid">

        {brands.map((brand) => (
          <BrandLogo
            key={brand.id}
            brand={brand}
          />
        ))}

      </div>

    </section>
  );
}