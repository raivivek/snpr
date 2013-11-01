namespace :curated_phenotypes do
  desc "Adds all possible curated phenotypes. CuratedUserPhenotypes have to be added manually later."
  task :create => :environment do
    if CuratedPhenotype.count != 0
      puts "Everything already done." # Alternative: Drop table
      exit
    end
    make_phenotype("Hair color", "Color of hair after Fischer-Saller scale.", false, ["Light blond", "Blond", "Dark Blond", "Brown", "Dark brown", "Red", "Red blond"], false, false)
    make_phenotype("Hair type", "Form of hair.", false, ["Straight", "Wavy", "Curly"], false, false)
    make_phenotype("Baldness", "Male or female baldness", false, ["None", "Male pattern baldness", "Female hairloss"], false, false)
    make_phenotype("Eye color", "Color of eyes after Martin-Schultz scale.", false, ["Blue", "Blue-gray", "Gray","Green","Light brown", "Hazel", "Medium brown", "Dark brown"], false, false)
    make_phenotype("Skin color", "Color of skin, after Fitzpatrick Scale.", false, ["Light, pale white", "White, fair", "Medium, white to olive", "Olive, moderate brown", "Brown, dark brown", "Very dark brown to black"], false, false)
    make_phenotype("Freckling", "How many freckles present on skin?", false, ["None", "Minor", "Major"], false, false)
    make_phenotype("Tanning habits", "Speed of which the skin tans and burns", false, ["Always burns, never tans", "Usually burns, tans difficult", "Sometimes mild burn", "Rarely burns", "Very rarely burns", "Extremely rarely burns"], false, false)
    make_phenotype("Albinism", "Complete or partial absence of pigment in skin, hair, etc.", false, ["No", "Yes"], false, false)
    make_phenotype("Handedness", "Which hand is used most of the time", false, ["Left", "Right", "Ambidextrous"], false, false)
    make_phenotype("Ring finger longer than index finger", "", false, ["No", "Yes"], false, false)
    make_phenotype("Widow's peak", "V-shaped point in center of hairline of forehead", false, ["No", "Yes"], false, false)
    make_phenotype("Earlobe", "Is the earlobe free or attached to the head?", false, ["Free", "Attached"], false, false)
    make_phenotype("Rolled tongue", "Is the tongue rollable?", false, ["No", "Yes"], false, false)
    make_phenotype("Ear wiggling", "Can ears be voluntarily moved?", false, ["No", "Yes"], false, false)
    make_phenotype("Morton's Toe", "Second toe is longer than first toe", false, ["No", "Yes"], false, false)
    # BMI is a time series!! I.e., several CuratedUserPhenotypes allowed
    make_phenotype("BMI", "Body Mass Index", true, ["Underweight (<18.5)", "Normal (18.5-25)", "Overweight (25-30)", "Obese (>30)"], false, false)
    make_phenotype("Blood pressure", "Blood pressure measured in mmHg", true, ["Normal (mHg 90-119)", "Prehypertension (mmHg 120-139)", "Stage 1 Hypertension (140-159)", "Stage 2 Hypertension (>160)", "Isolated systolic hypertension (>140, diastolic normal <90)"], false, false)
    make_phenotype("Color blindness", "Several types of color blindness possible.", false, ["No", "Partial (red-green, dichromacy)", "Partial (red-green, anomalous trichromacy)", "Partial (blue-yellow, dichromacy)", "Partial (blue-yellow, anomalous trichromacy"], false, false)
    make_phenotype("Lactose intolerance", "Inability to digest dairy products.", false, ["No", "Primary lactase deficiency", "Secondary/acquired/transient lactase deficiency", "Congenital lactase deficiency"], false, false)
    make_phenotype("ADHD", "Attention deficit hyperactivity disorder", false, ["No", "ADHD-I", "ADHD-H", "ADHD-C"], false, false)
    make_phenotype("Mood disorder", "Any clinically diagnosed mood disorder.", false, ["No", "Major depressive disorder", "Bipolar disorder"], false, false)
    make_phenotype("Asthma", "Any clinically diagnosed respiratory disorder.", false, ["No", "Intermittent (<= 2 times / week)", "Mild persistent (> 2 times / week)", "Moderate persistent (Daily)", "Severe persistent (Continuously)"], false, false)
    # now come addictions - leave in???
    make_phenotype("Caffeine addiction", "Clinically diagnosed caffeine addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Heroine addiction", "Clinically diagnosed heroine addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Nicotine addiction", "Clinically diagnosed nicotine addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Cocaine addiction", "Clinically diagnosed cocaine addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Alcohol addiction", "Clinically diagnosed alcohol addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Barbiturate addiction", "Clinically diagnosed barbiturate addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Benzodiazepane addiction", "Clinically diagnosed benzodiazepane addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Amphetamine addiction", "Clinically diagnosed amphetamine addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Ecstasy addiction", "Clinically diagnosed ecstasy addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("LSD addiction", "Clinically diagnosed LSD addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Cannabis addiction", "Clinically diagnosed cannabis addiction at any point in life.", false, ["No", "Yes"], false, false)
    make_phenotype("Astigmatism", "Optical defect, vision is blurred", false, ["No", "Regular", "Irregular"], false, false)
    make_phenotype("Gluten intolerance", "Clinically diagnosed intolerance to gluten products", false, ["No", "Yes"], false, false)
    make_phenotype("Soy intolerance", "Clinically diagnosed intolerance to soy products", false, ["No", "Yes"], false, false)
    make_phenotype("Wheat intolerance", "Clinically diagnosed intolerance to wheat products", false, ["No", "Yes"], false, false)
    make_phenotype("Amblyopia", "Impaired vision in an eye that otherwise appears to be normal", false, ["No", "Strabismic", "Refractive", "Deprivation"], false, false)
    make_phenotype("Blood type", "Blood type.", false, ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"], false, false)
    make_phenotype("Kell blood group", "Kell blood group.", false, ["K+k+", "K-k+", "Kp(a+b+)", "Kp(a-b+)"], false, false)
    make_phenotype("Migraine", "Recurrent headaches in association with autonomic nervous system symptoms", false, ["No", "Without aura (common)", "With aura (classic)", "Childhood periodic", "Retinal migraine", "Probable migraine", "Chronic migraine"], false, false)
    make_phenotype("Pervasive developmental disorder", "", false, ["No", "Atypical autism", "Autism", "Asperger syndrome", "Rett syndrome", "Childhood disintegrative disorder"], false, false)
    make_phenotype("Arthritis", "Inflammation of one or more joints.", false, ["No", "Osteoarthritis", "Rheumatoid arthritis", "Gout/pseudo-Gout", "Septic rthritis", "Ankylosing spondylitis", "Juvenile idiopathic arthritis", "Still's disease"], false, false)
    make_phenotype("Vitiligo", "Depigmentation of portions of skin.", false, ["No", "Yes"], false, false)
    make_phenotype("Diabetes", "", false, ["No", "Type I", "Type II", "Had gestitional diabetes"], false, false)
    # continuous phenotypes - [min, max, stepsize], not perfect solution
    make_phenotype("SAT without writing test", "", false, ["600", "1600", "30"], true, false)
    make_phenotype("SAT with writing test", "", false, ["900", "2400", "50"], true, false)
    make_phenotype("Full Scale IQ (WAIS-IV)", "", false, ["0", "200", "1"],true, false)
    make_phenotype("General Ability Index (WAIS-IV)", "", false, ["0", "200", "1"], true, false)
    make_phenotype("Childhood IQ (WISC-IV)", "", false, ["0", "200", "1"], true, false)
    make_phenotype("Spearman's g (Raven's Progressive Matrices)", "", false, ["0", "36", "1"], true, false)
    make_phenotype("Dyslexia", "", false, ["No", "Yes"], false, false)
    make_phenotype("Body height", "Measured in cm.", false, ["0", "300", "1"], true, false)
    make_phenotype("Allergies", "", false, ["Fruit", "Cow milk", "Soy", "Eggs", "Wheat", "Peanuts", "Tree nuts (walnuts", "Fish", "Shellfish", "Meat", "Urushiol (poison ivy)", "Penicillin", "Aspirin", "Latex", "Tetracycline", "Dilantin", "Tegretol", "Cephalospirines", "Sulfonamides", "Anasthetics", "Non-steroidal anti-inflammatories", "Pollen", "Cat", "Dog", "Insect stings", "Mold", "Perfume", "Cosmetics", "Semen", "Water", "Dust mites", "Nickel", "Gold", "Chromium", "Cobalt chloride", "Formalaldehyde"], false, true)
  end

  def make_phenotype(name, description, timeseries, children, is_series, is_multiple)
    c = CuratedPhenotype.create(:name => name, :description => description, :timeseries => timeseries, :is_series => is_series, :is_multiple => is_multiple)
    children.each do |ch|
      CuratedPhenotypeAnswer.create(:variation_name => ch, :curated_phenotype_id => c.id)
    end
  end
end
