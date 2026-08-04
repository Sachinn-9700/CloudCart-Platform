import "./VehicleSpecs.css";

export default function VehicleSpecs({ vehicle }) {

  const specs = [

    ["Model Year", vehicle.year],

    ["Driven", `${vehicle.mileage.toLocaleString()} km`],

    ["Engine", vehicle.engine],

    ["Power Output", `${vehicle.horsepower} HP`],

    ["Transmission", vehicle.transmission],

    ["Fuel Type", vehicle.fuelType],

    ["Drive Type", vehicle.drivetrain],

    ["Imported From", vehicle.importedFrom],

    ["Exterior", vehicle.exteriorColor],

    ["Interior", vehicle.interiorColor],

    ["Ownership", `${vehicle.owners} Owner`],

    ["Certification", vehicle.certified ? "CloudCart Certified" : "Verified"],

  ];

  return (

    <section className="vehicle-specs">

      <h2>
        Technical Specifications
      </h2>

      <div className="spec-grid">

        {specs.map(([label, value]) => (

          <div
            key={label}
            className="spec-card"
          >

            <small>
              {label}
            </small>

            <strong>
              {value}
            </strong>

          </div>

        ))}

      </div>

    </section>

  );

}

