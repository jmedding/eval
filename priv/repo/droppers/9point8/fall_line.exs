# 9point8 Fall Line 75 -> 150 mm

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

#  9point8
 d = Repo.insert! %Dropper {
 	brand: "9point8",
	model: "Fall Line", #  75-150mm Stroke
	manUrl: "https://intl.9point8.ca/index.php?route=product/product&path=42&product_id=123",
	internal: true,
	actuator: "cable",
	from: Ecto.Date.cast!("2015-01-10"),
	to: Ecto.Date.cast!("2018-01-01"),
	reliability: 5.0
 }

# Instances

	Repo.insert! %Instance {
				partNo: "0000-0703",
	    	diameter: "30.9",
	    	length: "75",
	    	price: 399.0,
	    	weight: 498.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0693",
	    	diameter: "30.9",
	    	length: "100",
	    	price: 399.0,
	    	weight: 498.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0600",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 399.0,
	    	weight: 498.0,
	    	remark: "Length 375mm",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0608",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 399.0,
	    	weight: 566.0,
	    	remark: "Length 415mm",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0616",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 399.0,
	    	weight: 570.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0707",
	    	diameter: "31.6",
	    	length: "75",
	    	price: 399.0,
	    	weight: 516.0,
	    	remark: "",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0697",
	    	diameter: "31.6",
	    	length: "100",
	    	price: 399.0,
	    	weight: 516.0,
	    	remark: "",
	    	dropper_id: d.id
	}


	Repo.insert! %Instance {
				partNo: "0000-0604",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 399.0,
	    	weight: 516.0,
	    	remark: "Length: 375mm",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0612",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 399.0,
	    	weight: 592.0,
	    	remark: "Length: 415mm",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "0000-0620",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 399.0,
	    	weight: 596.0,
	    	remark: "",
	    	dropper_id: d.id
	}


# Reviews

	Repo.insert! %Review {
			title: "9point8 Fall Line Dropper Post - Review",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/9point8-fall-line-dropper-post-review-2015.html",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 5.0,
			summary: "Installation was challenging, but extremely satified with operation.  No issues after 6 months of usage.  Extra credit awarded for the multi-orientation trigger.",
			published_on: Ecto.Date.cast!("2015-10-20"),
			rating: 3,
			dropper_id: d.id
	}

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