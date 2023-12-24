-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 1
entity brk_0CLK_b45f1687 is
port(
 phase : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end brk_0CLK_b45f1687;
architecture arch of brk_0CLK_b45f1687 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
function CONST_REF_RD_opcode_result_t_opcode_result_t_7303( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base.stack_address_sp_offset := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.is_vram_write := ref_toks_11;
      base.is_opc_done := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 


-- Combinatorial process for pipeline stages
process (
 -- Inputs
 phase)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_result : opcode_result_t;
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c18_c475_0 : unsigned(3 downto 0);
 variable VAR_result_device_ram_address_uxn_opcodes_h_l2850_c18_c475_0 : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l2850_c18_c475_0 : unsigned(7 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2850_c18_c475_0 : unsigned(15 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2855_c2_c3c2 : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7303_uxn_opcodes_h_l2862_c9_4c42_return_output : opcode_result_t;
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_opcodes_h_l2850_c18_c475_0 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c18_c475_0 := resize(to_unsigned(0, 1), 4);
     VAR_result_u8_value_uxn_opcodes_h_l2850_c18_c475_0 := resize(to_unsigned(0, 1), 8);
     VAR_result_u16_value_uxn_opcodes_h_l2850_c18_c475_0 := resize(to_unsigned(0, 1), 16);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2855_c2_c3c2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7303[uxn_opcodes_h_l2862_c9_4c42] LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7303_uxn_opcodes_h_l2862_c9_4c42_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7303(
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c18_c475_0,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_opcodes_h_l2850_c18_c475_0,
     to_unsigned(0, 1),
     VAR_result_u8_value_uxn_opcodes_h_l2850_c18_c475_0,
     VAR_result_u16_value_uxn_opcodes_h_l2850_c18_c475_0,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2855_c2_c3c2,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7303_uxn_opcodes_h_l2862_c9_4c42_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_phase := phase;

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
