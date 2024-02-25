-- Timing params:
--   Fixed?: True
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
-- Submodules: 64
entity sta2_0CLK_4674db74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4674db74;
architecture arch of sta2_0CLK_4674db74 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_8c0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_3c41]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9ada]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_07ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_208d]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_eefa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_1a8c]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_1ed2]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_83d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_8ef8]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_bcda]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_43b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_f848]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_d7e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_7748]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_7748]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_7748]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_7748]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_7748]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_0438]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_3c41
t16_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41
n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41
n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_07ad
t16_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad
n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad
n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_eefa
t16_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa
n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa
n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c
CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_83d7
t16_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7
n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7
n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8
BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2
n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2
n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_f848
sp_relative_shift_uxn_opcodes_h_l2366_c30_f848 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_7748
n16_low_MUX_uxn_opcodes_h_l2371_c7_7748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 n16_high,
 n16_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_1f9d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_c391 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_d7bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_c10e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_86c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_83d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_09f1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_6193 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_23d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l2334_l2379_DUPLICATE_646b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y := to_signed(-4, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_d7bb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_d7bb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_6193 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_6193;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_1f9d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_1f9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_86c0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_86c0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_c10e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_c10e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_c391 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_c391;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_8c0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_0438] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_d7e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_1ed2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output := result.u8_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9ada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_83d7_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_23d6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_23d6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_bcda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_208d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_f848] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_8c0d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9ada_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_208d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1ed2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_bcda_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d7e7_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_09f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_0438_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_23d6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_23d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_3b29_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_4f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_5217_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_4dd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_e1cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_3c41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_f848_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_09f1;
     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_1a8c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_7748] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_7748] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_7748] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_8ef8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_7748] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_7748] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_8ef8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_1a8c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7748_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_43b2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_43b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_83d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_83d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_eefa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_eefa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     -- t16_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_07ad] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_07ad_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_3c41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l2334_l2379_DUPLICATE_646b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l2334_l2379_DUPLICATE_646b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_3c41_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l2334_l2379_DUPLICATE_646b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l2334_l2379_DUPLICATE_646b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
