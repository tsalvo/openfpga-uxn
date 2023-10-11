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
-- Submodules: 80
entity deo_0CLK_3f857061 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_3f857061;
architecture arch of deo_0CLK_3f857061 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l525_c6_088e]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_c137]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_46a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l525_c2_49d6]
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l525_c2_49d6]
signal t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_49d6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l525_c2_49d6]
signal n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l526_c3_f327[uxn_opcodes_h_l526_c3_f327]
signal printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_dcc0]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_e48e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_46a6]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l530_c7_46a6]
signal t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_46a6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_46a6]
signal n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l533_c11_a5e1]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_1c93]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c7_e48e]
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l533_c7_e48e]
signal t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_e48e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c7_e48e]
signal n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_758e]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_740c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_1c93]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(31 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_1c93]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l537_c7_1c93]
signal n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_feef]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_c9a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_740c]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output : device_out_result_t;

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_740c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c7_740c]
signal n8_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l543_c32_3d24]
signal BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l543_c32_fdc7]
signal BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l543_c32_506c]
signal MUX_uxn_opcodes_h_l543_c32_506c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l543_c32_506c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l543_c32_506c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l543_c32_506c_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_1541]
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l547_c23_eb16]
signal device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_eb16_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_eb16_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_eb16_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_eb16_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_656c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.device_ram_value := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e
BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6
device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- t8_MUX_uxn_opcodes_h_l525_c2_49d6
t8_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6
result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6
result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6
result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- n8_MUX_uxn_opcodes_h_l525_c2_49d6
n8_MUX_uxn_opcodes_h_l525_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond,
n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue,
n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse,
n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

-- printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327
printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327 : entity work.printf_uxn_opcodes_h_l526_c3_f327_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6
device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_46a6
t8_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6
result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6
result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6
result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_46a6
n8_MUX_uxn_opcodes_h_l530_c7_46a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond,
n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1
BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e
device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c7_e48e
t8_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e
result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e
result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e
result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c7_e48e
n8_MUX_uxn_opcodes_h_l533_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond,
n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue,
n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse,
n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e
BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93
device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93
result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93
result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93
result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_1c93
n8_MUX_uxn_opcodes_h_l537_c7_1c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond,
n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef
BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_740c
device_out_result_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c
result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c
result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c
result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_740c
n8_MUX_uxn_opcodes_h_l540_c7_740c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_740c_cond,
n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24
BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left,
BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right,
BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7
BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left,
BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right,
BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output);

-- MUX_uxn_opcodes_h_l543_c32_506c
MUX_uxn_opcodes_h_l543_c32_506c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l543_c32_506c_cond,
MUX_uxn_opcodes_h_l543_c32_506c_iftrue,
MUX_uxn_opcodes_h_l543_c32_506c_iffalse,
MUX_uxn_opcodes_h_l543_c32_506c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output);

-- device_out_uxn_opcodes_h_l547_c23_eb16
device_out_uxn_opcodes_h_l547_c23_eb16 : entity work.device_out_0CLK_461bb655 port map (
clk,
device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l547_c23_eb16_device_address,
device_out_uxn_opcodes_h_l547_c23_eb16_value,
device_out_uxn_opcodes_h_l547_c23_eb16_phase,
device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read,
device_out_uxn_opcodes_h_l547_c23_eb16_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output,
 BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output,
 MUX_uxn_opcodes_h_l543_c32_506c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output,
 device_out_uxn_opcodes_h_l547_c23_eb16_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_3c08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_875e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_ec84 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_bbbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_1c93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c32_506c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c32_506c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c32_506c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c32_506c_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_d74b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_8135_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l550_c29_0220_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_e4eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_21e0_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l553_c23_da03_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_a5a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_656c_uxn_opcodes_h_l557_l520_DUPLICATE_6dd4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_3c08 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_3c08;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_ec84 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_ec84;
     VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l543_c32_506c_iffalse := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_bbbc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_bbbc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_875e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_875e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l543_c32_506c_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l543_c32_3d24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_left;
     BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output := BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_feef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c11_a5e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output := result.vram_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_1541] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_left;
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output := BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_1c93_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output := result.device_ram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c6_088e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_dcc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_758e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output := result.vram_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l543_c32_3d24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_088e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dcc0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_a5e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_758e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_feef_return_output;
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_1541_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_bead_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_67b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l530_l533_l540_l537_DUPLICATE_3fb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l530_l533_l525_l537_DUPLICATE_5c25_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_32c5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_f4fa_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_4bd9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_7e07_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l540_l533_l537_l525_l530_DUPLICATE_dd03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_1c93_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_c137] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l543_c32_fdc7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_left;
     BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output := BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output := n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l543_c32_506c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l543_c32_fdc7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_c137_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     -- n8_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- printf_uxn_opcodes_h_l526_c3_f327[uxn_opcodes_h_l526_c3_f327] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l526_c3_f327_uxn_opcodes_h_l526_c3_f327_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- MUX[uxn_opcodes_h_l543_c32_506c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l543_c32_506c_cond <= VAR_MUX_uxn_opcodes_h_l543_c32_506c_cond;
     MUX_uxn_opcodes_h_l543_c32_506c_iftrue <= VAR_MUX_uxn_opcodes_h_l543_c32_506c_iftrue;
     MUX_uxn_opcodes_h_l543_c32_506c_iffalse <= VAR_MUX_uxn_opcodes_h_l543_c32_506c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l543_c32_506c_return_output := MUX_uxn_opcodes_h_l543_c32_506c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue := VAR_MUX_uxn_opcodes_h_l543_c32_506c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- t8_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_c9a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- n8_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_c9a1_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- device_out[uxn_opcodes_h_l547_c23_eb16] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l547_c23_eb16_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l547_c23_eb16_device_address <= VAR_device_out_uxn_opcodes_h_l547_c23_eb16_device_address;
     device_out_uxn_opcodes_h_l547_c23_eb16_value <= VAR_device_out_uxn_opcodes_h_l547_c23_eb16_value;
     device_out_uxn_opcodes_h_l547_c23_eb16_phase <= VAR_device_out_uxn_opcodes_h_l547_c23_eb16_phase;
     device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l547_c23_eb16_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output := device_out_uxn_opcodes_h_l547_c23_eb16_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l554_c24_a5a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_a5a5_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l548_c32_d74b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_d74b_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.is_device_ram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l549_c31_8135] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_8135_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l551_c26_e4eb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_e4eb_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l553_c23_da03] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l553_c23_da03_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.vram_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l552_c25_21e0] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_21e0_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l550_c29_0220] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l550_c29_0220_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_eb16_return_output.device_ram_value;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_a5a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_d74b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_e4eb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l553_c23_da03_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_21e0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_8135_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l550_c29_0220_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_740c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l540_c7_740c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_1c93] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l537_c7_1c93_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_e48e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c7_e48e_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_46a6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l530_c7_46a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l525_c2_49d6] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_656c_uxn_opcodes_h_l557_l520_DUPLICATE_6dd4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_656c_uxn_opcodes_h_l557_l520_DUPLICATE_6dd4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_656c(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l525_c2_49d6_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_49d6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_656c_uxn_opcodes_h_l557_l520_DUPLICATE_6dd4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_656c_uxn_opcodes_h_l557_l520_DUPLICATE_6dd4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
