# Rockshox Reverb Stealth B1 dropper

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

# REVERB Stealth
d = Repo.insert! %Dropper {
	brand: "Rockshox",
	model: "Reverb Stealth B1",
	manUrl: "https://www.sram.com/rockshox/products/reverb-stealth#sm.0000r0to7l1a94f75ziu6epivyggb",
	from: Ecto.Date.cast!("2016-01-01"),
	to: Ecto.Date.cast!("2018-01-01"),
	internal: true,
	reliability: 3.0
}

	Repo.insert! %Instance {
				partNo: "00.6818.019.000",
	    	diameter: "30.9",
	    	length: "100",
	    	price: 471.0,
	    	weight: 500.0,
	    	remark: "Right side remote",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.004",
	    	diameter: "31.6",
	    	length: "100",
	    	price: 471.0,
	    	weight: 510.0,
	    	remark: "Right side remote",
	}	

	Repo.insert! %Instance {
				partNo: "00.6818.019.008",
	    	diameter: "34.9",
	    	length: "100",
	    	price: 471.0,
	    	weight: 520.0,
	    	remark: "Right side remote",
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.001",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 471.0,
	    	weight: 510.0,
	    	remark: "Right side remote",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.005",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 471.0,
	    	weight: 520.0,
	    	remark: "Right side remote",
	}	

	Repo.insert! %Instance {
				partNo: "00.6818.019.009",
	    	diameter: "34.9",
	    	length: "125",
	    	price: 471.0,
	    	weight: 530.0,
	    	remark: "Right side remote",
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.002",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 471.0,
	    	weight: 525.0,
	    	remark: "Right side remote",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.006",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 471.0,
	    	weight: 535.0,
	    	remark: "Right side remote",
	}	

	Repo.insert! %Instance {
				partNo: "00.6818.019.010",
	    	diameter: "34.9",
	    	length: "150",
	    	price: 471.0,
	    	weight: 545.0,
	    	remark: "Right side remote",
	}


	Repo.insert! %Instance {
				partNo: "00.6818.019.003",
	    	diameter: "30.9",
	    	length: "170",
	    	price: 471.0,
	    	weight: 560.0,
	    	remark: "Right side remote",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "00.6818.019.007",
	    	diameter: "31.6",
	    	length: "170",
	    	price: 471.0,
	    	weight: 570.0,
	    	remark: "Right side remote",
	}	

	Repo.insert! %Instance {
				partNo: "00.6818.019.011",
	    	diameter: "34.9",
	    	length: "170",
	    	price: 471.0,
	    	weight: 580.0,
	    	remark: "Right side remote",
	}


# Reviews

	Repo.insert! %Review {
			title: "Six dropper posts worth looking at",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/dropper-post-test-review-six-2015.html",
			logo_url: nil,
			reliability: 3.0,
			publisher_weight: 5.0,
			summary: "Complicated design is prone to failure and difficult to service. This version has been reworked and improved though. Positives are adjustable rebound speed and closed system is less prone to problems due to water and mud exposure.",
			published_on: Ecto.Date.cast!("2016-02-26"),
			rating: 3,
			dropper_id: d.id
	}