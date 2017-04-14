# KS LEV INTEGRA

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review


 d = Repo.insert! %Dropper {
 	brand: "KS",
	model: "LEV INTEGRA",
	manUrl: "http://kssuspension.com/product/lev-integra/",
	internal: true,
	from: Ecto.Date.cast!("2013-01-09"),
	to: Ecto.Date.cast!("2018-01-01"),
	reliability: 3.0
 }

# Instances


	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 100 30.9",
	    	diameter: "30.9",
	    	length: "100",
	    	price: 339.0,
	    	weight: 560.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 100 31.6",
	    	diameter: "31.6",
	    	length: "100",
	    	price: 339.0,
	    	weight: 570.0,
	    	remark: "",
	}	

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 100 34.9",
	    	diameter: "34.9",
	    	length: "100",
	    	price: 339.0,
	    	weight: 590.0,
	    	remark: "",
	}

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 125 30.9",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 339.0,
	    	weight: 585.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 125 31.6",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 339.0,
	    	weight: 595.0,
	    	remark: "",
	}	

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 125 34.9",
	    	diameter: "34.9",
	    	length: "125",
	    	price: 369.0,
	    	weight: 615.0,
	    	remark: "Right side remote",
	}

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 150 30.9",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 359.0,
	    	weight: 610.0,
	    	remark: "Right side remote",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 150 31.6",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 359.0,
	    	weight: 620.0,
	    	remark: "Right side remote",
	}	

	Repo.insert! %Instance {
				partNo: "LEV-INTEGRA 150 34.9",
	    	diameter: "34.9",
	    	length: "150",
	    	price: 389.0,
	    	weight: 635.0,
	    	remark: "Right side remote",
	}



	# Reviews

	Repo.insert! %Review {
			title: "Six dropper posts worth looking at",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/dropper-post-test-review-six-2015.html",
			logo_url: nil,
			reliability: 4.0,
			publisher_weight: 4.0,
			summary: "Smooth operation, and increased reliability after KS redesigned the lever connection.",
			published_on: Ecto.Date.cast!("2016-02-26"),
			rating: 3,
			dropper_id: d.id
	}

	Repo.insert! %Review {
			title: "The Lev Integra remains a frontrunner in the industry's dropper post parade",
			publisher: "Bikemag",
			review_url: "http://www.bikemag.com/gear/components/seatposts/review-ks-lev-integra-dropper-seatpost/#qvWbTttzGPHM7kvQ.97",
			logo_url: nil,
			reliability: 3.0,
			publisher_weight: 4.0,
			summary: "Smooth operation. Recommends upgrading to the Southpaw lever. Post can get stuck in the down position when left after a ride, but no issues during the ride.",
			published_on: Ecto.Date.cast!("2016-08-09"),
			rating: 3,
			dropper_id: d.id
	}

	Repo.insert! %Review {
			title: "KS LEV Integra seatpost post review",
			publisher: "MBR",
			review_url: "http://www.mbr.co.uk/reviews/seatposts/ks-lev-dropper-post-review",
			logo_url: nil,
			reliability: 3.0,
			publisher_weight: 4.0,
			summary: "Smooth operation. Reasonable weight and cost. Recommends upgrading to the Southpaw lever if running 1X. Post gets stuck in the down position when left after a ride, but no issues during the ride.",
			published_on: Ecto.Date.cast!("2016-02-16"),
			rating: 3,
			dropper_id: d.id
	}

	Repo.insert! %Review {
			title: "KS LEV Integra Dropper Post Review: Is This Your Next Dropper?",
			publisher: "WorldWide Cyclery Blog",
			review_url: "https://www.worldwidecyclery.com/blogs/worldwide-cyclery-blog/ks-lev-integra-dropper-post-review",
			logo_url: nil,
			reliability: 4.0,
			publisher_weight: 3.0,
			summary: "After one year of use, the reviewer liked the smooth operation. Recommends upgrading to the Southpaw lever if running 1X drivetrain. Post initially got stuck in the down position when left after a ride, but no issues during the ride.",
			published_on: Ecto.Date.cast!("2016-02-16"),
			rating: 3,
			dropper_id: d.id
	}