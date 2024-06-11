class Car {
  final String title;
  final String image;
  final String condition;
  final int km;
  final String transmission;
  final int price;
  final String location;
  final String description;
  final String type;
  final int capacity;
  final int seatCapacity;
  final String variant;
  final String make;
  final String model;

  Car(
      this.title,
      this.condition,
      this.km,
      this.transmission,
      this.price,
      this.location,
      this.image,
      this.description,
      this.type,
      this.capacity,
      this.seatCapacity,
      this.variant,
      this.make,
      this.model);
}

List<Car> cars = [
  Car(
      "Mercedes AMG GTS 2023",
      "New",
      1331,
      "Automatic",
      300000,
      "Bang Bon",
      "https://www.driving.co.uk/wp-content/uploads/sites/5/2023/08/mercedes-amg-gt-2023-008-edited.jpg",
      "The 2023 Mercedes-AMG GT S is a remarkable blend of luxury and performance. This high-performance coupe features a handcrafted 4.0-liter V8 biturbo engine, delivering an impressive 523 horsepower and 494 lb-ft of torque. Its sleek and aerodynamic design is accentuated by a wide stance, aggressive front grille, and distinctive LED headlights. Inside, the cabin exudes sophistication with premium materials, advanced technology, and a driver-focused layout. Equipped with AMG DYNAMIC SELECT, it offers multiple driving modes to tailor the driving experience. The 2023 AMG GT S promises exhilarating speed, precise handling, and unmatched comfort, making it a true icon of modern automotive engineering.",
      "Super Car",
      3999,
      2,
      "GT S",
      "Mercedes Benz",
      "AMG GTS"),
  Car(
      "BMW M4 2022",
      "Second Hand",
      45382,
      "Automatic",
      100000,
      "Istanbul",
      "https://octane.rent/wp-content/uploads/2023/03/bmw-m4-yellow-1-600x400.webp",
      "The 2022 BMW M4 is a stunning example of German engineering and performance. Powered by a 3.0-liter inline-6 twin-turbo engine, it produces an exhilarating 473 horsepower and 406 lb-ft of torque, with the Competition model pushing even further. Its muscular exterior features a bold kidney grille, aerodynamic lines, and striking LED headlights. The interior is a blend of luxury and sportiness, offering premium materials, advanced technology, and M-specific details. Equipped with adaptive M suspension and various driving modes, the M4 delivers a dynamic and engaging driving experience. The 2022 BMW M4 is a perfect fusion of power, style, and precision.",
      "Coupe",
      2499,
      4,
      "Competition",
      "BMW",
      "M4"),
  Car(
      "Ferrari 488 Pista Spider",
      "New",
      0,
      "Automatic",
      756000,
      "New Jersey",
      "https://www.ferrariofcentralnj.com/imagetag/14666/65/l/Used-2020-Ferrari-488-Pista-Spider-Spider-1628332560.jpg",
      "The Ferrari 488 Pista Spider epitomizes high-performance and Italian craftsmanship. This convertible supercar is powered by a 3.9-liter V8 twin-turbo engine, producing a breathtaking 710 horsepower and 568 lb-ft of torque. Its design combines elegance and aggression, with aerodynamic enhancements, sculpted lines, and the iconic Ferrari flair. The open-top experience is enhanced by a lightweight structure and refined interior, featuring premium materials and advanced technology. The 488 Pista Spider offers exceptional handling and responsiveness, thanks to its advanced aerodynamics and state-of-the-art suspension. It is a masterful blend of speed, style, and exhilaration, delivering an unforgettable driving experience.",
      "Super Car",
      6000,
      2,
      "Spider",
      "Ferrari",
      "488 Pista"),
];

Car recommendedCar = Car(
    "Taycan Turbo S",
    "New",
    32207,
    "Manuel",
    124000,
    "New York",
    "https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMHIspbWvanYb%255y%25oq%25vSTmjMXD4qAZeoNBPUSfUx4RmWBisGK7Zlp0KtYYF%25mVSW8uAVbsqYSY6x0iO5MobCvNzxGczGXoq1ZAEr6FObM4CwRuT0kuix7Jv5c0jQvpjs3VrVO5Vb2rEUA6efcRHfc",
    "The Porsche Taycan Turbo S represents the pinnacle of electric performance and luxury. Boasting a dual-motor setup, it delivers an astonishing 750 horsepower and 774 lb-ft of torque in overboost mode. This electric powerhouse accelerates from 0 to 60 mph in just 2.6 seconds. Its sleek, aerodynamic design features a low stance, sharp lines, and signature Porsche styling. The interior is a blend of cutting-edge technology and refined luxury, with high-quality materials and a driver-centric layout. Equipped with adaptive air suspension and multiple drive modes, the Taycan Turbo S offers exceptional handling and a dynamic driving experience. It’s a groundbreaking fusion of innovation, speed, and sophistication.",
    "Super Car",
    6000,
    2,
    "Turbo S",
    "Porsche",
    "Taycan");
