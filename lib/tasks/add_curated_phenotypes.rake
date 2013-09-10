namespace :curated_phenotypes do
  desc "Adds all possible curated phenotypes. CuratedUserPhenotypes have to be added manually later."
  task :create => :environment do
    if CuratedPhenotype.count != 0
      puts "Everything already done." # Alternative: Drop table
      exit
    end
  make_phenotype("Hair color", "Color of hair after Fischer-Saller scale.", false, ["Light blond", "Blond", "Dark Blond", "Brown", "Dark brown", "Red", "Red blond"])
  make_phenotype("Hair type", "Form of hair.", false, ["Straight", "Wavy", "Curly"])
  make_phenotype("Baldness", "Male or female baldness", false, ["None", "Male pattern baldness", "Female hairloss"])
  make_phenotype("Eye color", "Color of eyes after Martin-Schultz scale.", false, ["Blue", "Blue-gray", "Gray","Green","Light brown", "Hazel", "Medium brown", "Dark brown"])
  make_phenotype("Skin color", "Color of skin, after Fitzpatrick Scale.", false, ["Light, pale white", "White, fair", "Medium, white to olive", "Olive, moderate brown", "Brown, dark brown", "Very dark brown to black"])
  make_phenotype("Freckling", "How many freckles present on skin?", false, ["None", "Minor", "Major"])
  make_phenotype("Tanning habits", "Speed of which the skin tans and burns", false, ["Always burns, never tans", "Usually burns, tans difficult", "Sometimes mild burn", "Rarely burns", "Very rarely burns", "Extremely rarely burns"])
  make_phenotype("Albinism", "Complete or partial absence of pigment in skin, hair, etc.", false, ["No", "Yes"])
  make_phenotype("Handedness", "Which hand is used most of the time", false, ["Left", "Right", "Ambidextrous"])
  make_phenotype("Ring finger longer than index finger", "", false, ["No", "Yes"])
  make_phenotype("Widow's peak", "V-shaped point in center of hairline of forehead", false, ["No", "Yes"])
  make_phenotype("Earlobe", "Is the earlobe free or attached to the head?", false, ["Free", "Attached"])
  make_phenotype("Rolled tongue", "Is the tongue rollable?", false, ["No", "Yes"])
  make_phenotype("Ear wiggling", "Can ears be voluntarily moved?", false, ["No", "Yes"])
  make_phenotype("Morton's Toe", "Second toe is longer than first toe", false, ["No", "Yes"])
  # BMI is a time series!! I.e., several CuratedUserPhenotypes allowed
  make_phenotype("BMI", "Body Mass Index", true, ["Underweight (<18.5)", "Normal (18.5-25)", "Overweight (25-30)", "Obese (>30)"])
  make_phenotype("Blood pressure", "Blood pressure measured in mmHg", true, ["Normal (mHg 90-119)", "Prehypertension (mmHg 120-139)", "Stage 1 Hypertension (140-159)", "Stage 2 Hypertension (>160)", "Isolated systolic hypertension (>140, diastolic normal <90)"])
  make_phenotype("Color blindness", "Several types of color blindness possible.", false, ["No", "Partial (red-green, dichromacy)", "Partial (red-green, anomalous trichromacy)", "Partial (blue-yellow, dichromacy)", "Partial (blue-yellow, anomalous trichromacy"])
  make_phenotype("Lactose intolerance", "Inability to digest dairy products.", false, ["No", "Primary lactase deficiency", "Secondary/acquired/transient lactase deficiency", "Congenital lactase deficiency"])
  make_phenotype("ADHD", "Attention deficit hyperactivity disorder", false, ["No", "ADHD-I", "ADHD-H", "ADHD-C"])
  make_phenotype("Mood disorder", "Any clinically diagnosed mood disorder.", false, ["No", "Major depressive disorder", "Bipolar disorder"])
  make_phenotype("Asthma", "Any clinically diagnosed respiratory disorder.", false, ["No", "Intermittent (<= 2 times / week)", "Mild persistent (> 2 times / week)", "Moderate persistent (Daily)", "Severe persistent (Continuously)"])
  # now come addictions - leave in???
  make_phenotype("Caffeine addiction", "Clinically diagnosed caffeine addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Heroine addiction", "Clinically diagnosed heroine addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Nicotine addiction", "Clinically diagnosed nicotine addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Cocaine addiction", "Clinically diagnosed cocaine addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Alcohol addiction", "Clinically diagnosed alcohol addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Barbiturate addiction", "Clinically diagnosed barbiturate addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Benzodiazepane addiction", "Clinically diagnosed benzodiazepane addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Amphetamine addiction", "Clinically diagnosed amphetamine addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Ecstasy addiction", "Clinically diagnosed ecstasy addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("LSD addiction", "Clinically diagnosed LSD addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Cannabis addiction", "Clinically diagnosed cannabis addiction at any point in life.", false, ["No", "Yes"])
  make_phenotype("Astigmatism", "Optical defect, vision is blurred", false, ["No", "Regular", "Irregular"])
  make_phenotype("Gluten intolerance", "Clinically diagnosed intolerance to gluten products", false, ["No", "Yes"])
  make_phenotype("Soy intolerance", "Clinically diagnosed intolerance to soy products", false, ["No", "Yes"])
  make_phenotype("Wheat intolerance", "Clinically diagnosed intolerance to wheat products", false, ["No", "Yes"])
  make_phenotype("Amblyopia", "Impaired vision in an eye that otherwise appears to be normal", false, ["No", "Strabismic", "Refractive", "Deprivation"])
  make_phenotype("Blood type", "Blood type.", false, ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"])
  make_phenotype("Kell blood group", "Kell blood group.", false, ["K+k+", "K-k+", "Kp(a+b+)", "Kp(a-b+)"])
  make_phenotype("Migraine", "Recurrent headaches in association with autonomic nervous system symptoms", false, ["No", "Without aura (common)", "With aura (classic)", "Childhood periodic", "Retinal migraine", "Probable migraine", "Chronic migraine"])
  make_phenotype("Pervasive developmental disorder", "", false, ["No", "Atypical autism", "Autism", "Asperger syndrome", "Rett syndrome", "Childhood disintegrative disorder"])
  make_phenotype("Arthritis", "Inflammation of one or more joints.", false, ["No", "Osteoarthritis", "Rheumatoid arthritis", "Gout/pseudo-Gout", "Septic rthritis", "Ankylosing spondylitis", "Juvenile idiopathic arthritis", "Still's disease"])
  make_phenotype("Vitiligo", "Depigmentation of portions of skin.", false, ["No", "Yes"])
  make_phenotype("Diabetes", "", false, ["No", "Type I", "Type II", "Had gestitional diabetes"])

  end

  def make_phenotype(name, description, timeseries, children)
    c = CuratedPhenotype.create(:name => name, :description => description, :timeseries => timeseries)
    children.each do |ch|
      CuratedPhenotypeAnswer.create(:variation_name => ch, :curated_phenotype_id => c.id)
    end
  end
end
