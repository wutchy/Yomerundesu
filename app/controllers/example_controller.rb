# coding: utf-8
class ExampleController < ApplicationController

  require "json"
  require "ibm_watson/visual_recognition_v3"
  include IBMWatson

  protect_from_forgery

  def top
  end

  def food_upload
  end

  def face_upload
  end

  def general_upload
  end

  #文字認証
  def text
  end

  #食べ物認証
  def food
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: "dJocI43alxAPvPH_uK-GyLx53yi6pfJ4YI_AVDlTgo_c"
    )
    File.binwrite("public/images/test.jpg",params[:image].read)
    @image="/images/test.jpg"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      classes = visual_recognition.classify(
        images_file: images_file,
        classifier_ids:["food"],
        accept_language: ["ja"]
      )
      @food= JSON.parse(JSON.pretty_generate(classes.result))["images"][0]["classifiers"][0]["classes"]
    end
  end

  #なんでも認証
  def general
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: "dJocI43alxAPvPH_uK-GyLx53yi6pfJ4YI_AVDlTgo_c"
    )
    File.binwrite("public/images/test.jpg",params[:image].read)
    @image="/images/test.jpg"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      classes = visual_recognition.classify(
        images_file: images_file,
        #classifier_ids:["text"],
        accept_language: ["ja"]
      )
      @general= JSON.parse(JSON.pretty_generate(classes.result))["images"][0]["classifiers"][0]["classes"]
    end
  end

  #食べ物認証
  def face
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: "dJocI43alxAPvPH_uK-GyLx53yi6pfJ4YI_AVDlTgo_c"
    )
    File.binwrite("public/images/test.jpg",params[:image].read)
    @image="/images/test.jpg"
    File.open("#{Rails.root}/public#{@image}") do |images_file|
      faces = visual_recognition.detect_faces(
        images_file: images_file
      )
      @face=JSON.parse(JSON.pretty_generate(faces.result))["images"][0]["faces"][0]
    end
  end

end
