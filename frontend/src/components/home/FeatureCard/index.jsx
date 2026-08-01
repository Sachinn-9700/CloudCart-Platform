import "./FeatureCard.css";

export default function FeatureCard({ feature }) {

  return (

    <div className="feature-card">

      <div className="feature-icon">

        ✓

      </div>

      <h3>

        {feature.title}

      </h3>

      <p>

        {feature.description}

      </p>

    </div>

  );

}