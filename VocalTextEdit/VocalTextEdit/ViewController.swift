//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by annilq on 2020/4/27.
//  Copyright © 2020 annilq. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSSpeechSynthesizerDelegate {
    var contents:String?{
        get{
            return  textView.string
        }
        set{
            textView.string = newValue ?? ""
        }
    }
    var speechSyntheesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView:NSTextView!
    @IBOutlet var speakButton:NSButton!
    @IBOutlet var stopButton:NSButton!
    @IBOutlet var indicator:NSProgressIndicator!
    
    @IBAction func speakButtonClick(_ sender:NSButton){
        if(!textView.string.isEmpty){
            speechSyntheesizer.startSpeaking(textView.string)
        }else{
            speechSyntheesizer.startSpeaking("文档是空的")
            
        }
    }
    @IBAction func stopButtonClick(_ sender:NSButton){
        speechSyntheesizer.stopSpeaking()
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        speakButton.isEnabled = true
        stopButton.isEnabled = false
        indicator.doubleValue = 0.0
    }
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        speakButton.isEnabled = false
        stopButton.isEnabled = true
        let pc = (Double(characterRange.location)) / Double(string.count)
        indicator.doubleValue = Double((pc * 100))
    }
    override func viewDidLoad() {
        speechSyntheesizer.delegate = self
        indicator.doubleValue = 0.0
    }
    
}

