class ExampleController < ApplicationController

  require "json"
  require "ibm_watson/visual_recognition_v3"
  include IBMWatson

  def aaa
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ""
    )
    @image="/banana.gif"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      classes = visual_recognition.classify(
        images_file: images_file,
        classifier_ids:["food"]
      )
      @aaa= JSON.parse(JSON.pretty_generate(classes.result))["images"][0]["classifiers"][0]["classes"]
    end
  end

  def bbb
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ""
    )
    @image="/english.jpg"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      classes = visual_recognition.classify(
        images_file: images_file,
        classifier_ids:["text"],
        #accept_language: ["en", "ja"]
      )
      @bbb=JSON.pretty_generate(classes.result)
    end
  end

  def ccc
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ""
    )
    @image="/shuma.jpg"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      faces = visual_recognition.detect_faces(
        images_file: images_file
      )
      @ccc=JSON.pretty_generate(faces.result)
    end
  end

end
