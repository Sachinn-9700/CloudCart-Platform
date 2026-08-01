import "./WhyChooseUs.css";

import features from "../../../data/features";

import FeatureCard from "../FeatureCard";

export default function WhyChooseUs(){

return(

<section className="why-cloudcart">

<div className="section-heading">

<p>

WHY CLOUDCART

</p>

<h2>

Luxury Without Compromise

</h2>

</div>

<div className="feature-grid">

{

features.map(feature=>(

<FeatureCard

key={feature.id}

feature={feature}

/>

))

}

</div>

</section>

);

}