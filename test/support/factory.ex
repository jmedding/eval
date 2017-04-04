defmodule Eval.Factory do
	use ExMachina.Ecto, repo: Eval.Repo



	def dropper_factory do
		%Eval.Dropper{
			brand: "Brand",
			model: "AwesomeDropper5",
			manUrl: "some.url.com",
			from: "2016-01-01",
			to: "2018-01-01",
			reliability: 5.0
		}
	end

	def instance_factory do
		%Eval.Instance{
			partNo: "123abc",
    	diameter: "30.9",
    	length: "150",
    	price: 425,
    	weight: 477,
    	dropper: build(:dropper)
		}
	end

	def review_factory do
		%Eval.Review{
			title: "Title",
			publisher: "Publisher",
			review_url: "url.com/review",
			logo_url: "url.com/logo",
			reliability: 7.0,
			publisher_weight: 5.0,
			summary: "Summary",
			published_on: "2016-11-23",
			rating: 3,
			dropper: build(:dropper)
		}
	end
end