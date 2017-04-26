# Magura Vyron Elect

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

#  Vyron Elect
 d = Repo.insert! %Dropper {
 	brand: "Magura",
	model: "Vyron ELECT",
	manUrl: "http://www.magura.com/en/components/bike/trailseries/productdetailpage/?p=2581",
	internal: true,
	actuator: "wireless",
	from: Ecto.Date.cast!("2016-08-26"),
	to: Ecto.Date.cast!("2018-01-01"),
	reliability: 3.0
 }

# Instances

	Repo.insert! %Instance {
				partNo: "2 700 931",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 499.0,
	    	weight: 595.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "2 700 932",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 499.0,
	    	weight: 610.0,
	    	remark: "",
	    	dropper_id: d.id
	}

# Reviews

	Repo.insert! %Review {
			title: "First Ride and Review: Magura’s Vyron Wireless Dropper Post",
			publisher: "Cyclocross Magazine",
			review_url: "https://www.cxmagazine.com/magura-vyron-elect-wireless-dropper-post-review",
			logo_url: nil,
			reliability: 4.0,
			publisher_weight: 3.0,
			summary: "Easy installation as there are no cable or hydraulic lines to route. Secure, two-bolt saddle clamp. Smooth operation. Slow actuation due to motor. Hard to find remote button.",
			published_on: Ecto.Date.cast!("2016-05-20"),
			rating: 3,
			dropper_id: d.id
	}

	Repo.insert! %Review {
			title: "Magura Vyron Wireless Dropper Post - First Ride",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/ride-report-magura-vyron-elect-wireless-dropper-post-2016.html",
			logo_url: nil,
			reliability: 4.0,
			publisher_weight: 4.0,
			summary: "Easy installation as there are no cable or hydraulic lines to route. No 'clunk' sound when post reaches the top of its travel. Smooth operation. Slow actuation due to motor. Setting a mid-stroke position is tricky due to the motion-triggered valve closing.",
			published_on: Ecto.Date.cast!("2016-06-21"),
			rating: 3,
			dropper_id: d.id
	}