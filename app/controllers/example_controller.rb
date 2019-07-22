class ExampleController < ApplicationController

  require "json"
  require "ibm_watson/visual_recognition_v3"
  include IBMWatson

  def aaa





    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: "UijvdSiykSyVcX9zu4yyOch4dzLYgDvMj8bVJZfo8ERL"
    )



    File.open("#{Rails.root}/public/banana.gif") do |images_file|
      classes = visual_recognition.classify(
        images_file: images_file,
        # threshold: "0.2",
        # owners: ["me"]
        classifier_ids:["food"]
      )
      @aaa= JSON.pretty_generate(classes.result)
    end

  end


end
