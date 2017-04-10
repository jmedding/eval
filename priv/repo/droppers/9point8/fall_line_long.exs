# 9point8 Fall Line 175 -> 200 mm

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

d = Repo.insert! %Dropper {
	brand: "9point8",
	model: "Fall Line 175-200mm Stroke",
	manUrl: "https://intl.9point8.ca/index.php?route=product/product&path=42&product_id=121",
	from: Ecto.Date.cast!("2016-01-01"),
	to: Ecto.Date.cast!("2018-01-01"),
	internal: true,
	reliability: 5.0
}

	Repo.insert! %Instance {
				partNo: "0000-0718",
	    	diameter: "30.9",
	    	length: "175",
	    	price: 449.0,
	    	weight: 527.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0727",
	    	diameter: "30.9",
	    	length: "200",
	    	price: 449.0,
	    	weight: 554.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0722",
	    	diameter: "31.6",
	    	length: "175",
	    	price: 449.0,
	    	weight: 564.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0731",
	    	diameter: "31.6",
	    	length: "200",
	    	price: 449.0,
	    	weight: 594.0,
	    	remark: "",
	    	dropper_id: d.id
	}


# Reviews

	Repo.insert! %Review {
			title: "Six dropper posts worth looking at",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/dropper-post-test-review-six-2015.html",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 5.0,
			summary: "Challenging installation, many legths available, good function.  Asserts this is the most reliable dropper post on the market.  Flexible trigger mounting a plus",
			published_on: Ecto.Date.cast!("2016-02-26"),
			rating: 3,
			dropper_id: d.id
	}